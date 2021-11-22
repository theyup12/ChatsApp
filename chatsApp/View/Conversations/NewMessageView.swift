//
//  NewMessageView.swift
//  chatsApp
//
//  Created by Andy Cao on 2021/11/22.
//

import SwiftUI

struct NewMessageView: View {
    @State private var searchText = ""
    @State private var isEditing = false
    @Binding var showChatView: Bool
    @Environment(\.presentationMode) var mode
    var body: some View {
        ScrollView{
            //vertical
            SearchBar(text: $searchText, isEditing: $isEditing).onTapGesture {
                isEditing.toggle()}.padding()
            VStack(alignment:.leading){
                ForEach((0...10), id: \.self){_ in
                    Button(action: {showChatView.toggle()
                         mode.wrappedValue.dismiss()
                    }, label: { UserCell()
                    })
                }
            }
        }
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView(showChatView: .constant(true))
    }
}
