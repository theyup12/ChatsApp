//
//  Message.swift
//  chatsApp
//
//  Created by Andy Cao on 2021/11/25.
//

import Foundation

struct Message : Identifiable{
    let id = NSUUID().uuidString
    let isFromCurrentUser: Bool
    let messageText: String
    
}
