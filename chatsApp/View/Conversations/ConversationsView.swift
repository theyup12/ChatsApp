//
//  ConversationsView.swift
//  chatsApp
//
//  Created by Andy Cao on 2021/11/12.
//

import SwiftUI

struct ConversationsView: View {
    @State private var showNewMessageView = false
    @State private var showChatView = false
    var body: some View {
        //things stacked on top of each other
        ZStack(alignment: .bottomTrailing){
            NavigationLink(destination: ChatView(), isActive: $showChatView, label:{ })
            //chats
            //scroll down and up
            ScrollView{
                //vertical
                VStack(alignment:.leading){
                    ForEach((0...10), id: \.self){_ in
                        NavigationLink(destination: ChatView(), label: {ConversationsCell()})
                    }
                }
            }
            //floating button
            Button(action: {showNewMessageView.toggle()}, label: {Image(systemName: "square.and.pencil").resizable().scaledToFit().frame(width: 24, height: 24).padding()
            }).background(Color(.systemBlue)).foregroundColor(.white).clipShape(Circle()).padding().sheet(isPresented: $showNewMessageView, content: {NewMessageView(showChatView: $showChatView)
            })
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
