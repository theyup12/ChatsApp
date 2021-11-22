//
//  EditProfileView.swift
//  chatsApp
//
//  Created by Andy Cao on 2021/11/13.
//

import SwiftUI

struct EditProfileView: View {
    @State private var fullname = "Andy"
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage:Image?
    var body: some View {
        ZStack{
            Color(.systemGroupedBackground).ignoresSafeArea()
            VStack(alignment: .leading, spacing: 44){
                //header with photo and eidt button
                VStack{
                    HStack{
                        VStack{
                            if let profileImage = profileImage{
                                profileImage.resizable()
                                    .scaledToFit()
                                    .frame(width: 64, height:64)
                                    .clipShape(Circle())
                            }else{
                                    Image("account_img").resizable()
                                        .scaledToFit()
                                        .frame(width: 64, height:64)
                                        .clipShape(Circle())
                            }
                            Button(action: {showImagePicker.toggle()}, label:{Text("Edit")
                            })
                                .sheet(isPresented: $showImagePicker,onDismiss: loadImage){ ImagePicker(image: $selectedImage)}
                        }.padding(.top)
                        Text("Enter your name or change your profile photo").font(.system(size:16)).foregroundColor(.gray).padding([.bottom, .horizontal])
                    }
                    Divider().padding(.horizontal)
                    TextField("", text: $fullname)
                        .padding(8)
                }.background(Color.white)
                
                //status
                VStack(alignment:.leading){
                    //status text
                    Text("Status").padding().foregroundColor(.gray)
                    //status
                    NavigationLink(destination: StatusSelectorView(), label: {
                        HStack{
                        Text("At the Movies")
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right").foregroundColor(.gray)
                    }.padding().background(Color.white)
                        
                    })
                }
                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle("Edit Profile")
    }
    func loadImage(){
        guard let selectedImage = selectedImage else {return}
        profileImage = Image(uiImage: selectedImage)

    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
