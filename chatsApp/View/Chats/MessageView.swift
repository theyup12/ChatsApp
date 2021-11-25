//
//  MessageView.swift
//  chatsApp
//
//  Created by Andy Cao on 2021/11/22.
//

import SwiftUI

struct MessageView: View {
    var isFromCurrentUser: Bool
    var messageText: String
    var body: some View {
        HStack{
            if isFromCurrentUser{
                Spacer();
                Text(messageText).padding(12).background(Color.blue).font(.system(size:15)).clipShape(ChatBubble(isFromCurrentUser: true)).foregroundColor(.white).padding(.leading, 100).padding(.horizontal)
            }else{
                HStack(alignment: .bottom){
                    Image("account_img").resizable().scaledToFill().frame(width: 32, height: 32).clipShape(Circle())
                    Text(messageText).padding(12).background(Color(.systemGray5)).font(.system(size:15)).clipShape(ChatBubble(isFromCurrentUser: false)).foregroundColor(.black)
                }.padding(.horizontal)
                .padding(.trailing, 80)
                Spacer()
            }
        }
    }
}
