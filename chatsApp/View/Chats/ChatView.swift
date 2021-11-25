//
//  ChatsView.swift
//  chatsApp
//
//  Created by Andy Cao on 2021/11/12.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    @ObservedObject var viewModel = ChatViewModel()
    var body: some View {
        VStack {
            //messages
            ScrollView{
                VStack(alignment: .leading, spacing: 12){
                    ForEach(viewModel.messages){ message in
                        MessageView(isFromCurrentUser: message.isFromCurrentUser, messageText: message.messageText)
                    }
                }
            }
            
            //input view
            CustomInputView(text: $messageText, action: sendMessage)
        }.navigationTitle("Hi world").navigationBarTitleDisplayMode(.inline).padding(.vertical)
    }
    
    func sendMessage(){
        viewModel.sendMessage(messageText)
        messageText = ""
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
