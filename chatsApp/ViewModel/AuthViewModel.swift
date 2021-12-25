//
//  AuthViewModel.swift
//  chatsApp
//
//  Created by Andy Cao on 2021/12/22.
//

import Firebase
import UIKit

class AuthViewModel: NSObject, ObservableObject{
    @Published var didAuthenticateUser = false;
    @Published var userSession: FirebaseAuth.User?
    private var tempCurrentUser: FirebaseAuth.User?
    
    static let shared = AuthViewModel()
    
    override init(){
        userSession = Auth.auth().currentUser
    }
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password){result, error in
            if let error = error{
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            self.userSession = result?.user
        }
    }
    func register(withEmail email: String, password: String, fullname: String, username:String){
        Auth.auth().createUser(withEmail: email, password: password){
            result, error in
            if let error = error{
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else{return}
            self.tempCurrentUser = user
            let data: [String: Any] = ["email": email, "username": username, "fullname": fullname]
            
            Firestore.firestore().collection("users").document(user.uid).setData(data){ _ in
                
                self.didAuthenticateUser = true
            }
        }
        
    }
    func uploadProfileImage(_ image: UIImage){
        guard let uid = tempCurrentUser?.uid else{
            print("DEBUG: Failed to set temp current user..")
            return}
        ImageUploader.uploadImage(image: image){ imageUrl in
            Firestore.firestore().collection("users").document(uid).updateData(["profileImageUrl": imageUrl]){_ in
            }
        }
    }
    func signout(){
        self.userSession = nil
        try? Auth.auth().signOut()
    }
}
