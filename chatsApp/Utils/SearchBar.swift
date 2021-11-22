//
//  SearchBar.swift
//  chatsApp
//
//  Created by Andy Cao on 2021/11/22.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var isEditing: Bool
    var body: some View {
        HStack{
            TextField("Search...", text:$text).padding(8).padding(.horizontal, 28).background(Color(.systemGray6)).cornerRadius(8).overlay( Image(systemName: "magnifyingglass").foregroundColor(.gray).frame(minWidth:0, maxWidth: .infinity, alignment: .leading).padding(8)
            )
            if isEditing{
                Button(action: {
                    isEditing = false
                    text=""
                    UIApplication.shared.endEditing()
                }, label: {Text("Cancel").foregroundColor(.black)
                    
                }).padding(.trailing, 8).transition(.move(edge: .trailing)).animation(.default)
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Search..."), isEditing: .constant(false))
    }
}
