//
//  ChatsView.swift
//  chatsApp
//
//  Created by Andy Cao on 2021/11/12.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    var body: some View {
        VStack {
            //messages
            ScrollView{
                VStack(alignment: .leading, spacing: 12){
                    ForEach((0 ... 10), id: \.self){ _ in
                       MessageView(isFromCurrentUser: false)
                    }
                }
            }
            
            //input view
            CustomInputView(text: $messageText, action: sendMessage)
        }.navigationTitle("Hi world").navigationBarTitleDisplayMode(.inline).padding(.vertical)
    }
    
    func sendMessage(){
        print("Send Message \(messageText)")
        messageText = ""
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
