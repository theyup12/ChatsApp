//
//  chatsAppApp.swift
//  chatsApp
//
//  Created by Andy Cao on 2021/11/11.
//

import SwiftUI
import Firebase
@main
struct chatsAppApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            LoginView().environmentObject(AuthViewModel())
        }
    }
}
