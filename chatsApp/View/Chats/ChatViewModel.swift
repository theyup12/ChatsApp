//
//  ChatViewModel.swift
//  chatsApp
//
//  Created by Andy Cao on 2021/11/25.
//

import Foundation

class ChatViewModel: ObservableObject{
    @Published var messages = [Message]()
    
    init(){
        messages = mockMessages
    }
    var mockMessages:[Message]{
        [
        .init(isFromCurrentUser: true, messageText: "Hey what's up"),
        .init(isFromCurrentUser: false, messageText: "working on projects, how are you"),
        .init(isFromCurrentUser: true, messageText: "oh me too"),
        .init(isFromCurrentUser: false, messageText: "Really?"),
        .init(isFromCurrentUser: true, messageText: "yeah"),
        .init(isFromCurrentUser: false, messageText: "Cool, see you later"),
        .init(isFromCurrentUser: true, messageText: "alright"),
        ]
    }
    func sendMessage(_ messageText: String){
        let message = Message(isFromCurrentUser: true, messageText: messageText)
        messages.append(message)
    }
}
