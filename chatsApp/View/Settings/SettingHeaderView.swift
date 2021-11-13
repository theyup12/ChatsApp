//
//  SettingHeaderView.swift
//  chatsApp
//
//  Created by Andy Cao on 2021/11/12.
//
import SwiftUI
struct SettingsHeaderView: View {
    var body: some View {
        HStack{
            Image("account_img")
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
                .padding(.leading)
            VStack(alignment: .leading, spacing: 4){
                Text("Andy").font(.system(size: 18)).foregroundColor(.black)
                
                Text("Available").foregroundColor(.gray).font(.system(size:14))
            }
            Spacer()
        }.frame(height: 80).background(Color.white)
    }
}
