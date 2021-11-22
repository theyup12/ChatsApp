//
//  UserCell.swift
//  chatsApp
//
//  Created by Andy Cao on 2021/11/22.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        VStack {
            HStack{
                //image
                Image("account_img").resizable().scaledToFill().frame(width: 48, height: 48).clipShape(Circle())
                //message info
                VStack(alignment: .leading, spacing: 4){
                    Text("theyup12").font(.system(size: 14, weight: .semibold))
                    Text("Andy Cao").font(.system(size: 15))
                }.foregroundColor(.black)
                Spacer()
            }.padding(.horizontal)
        }.padding(.top)
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
