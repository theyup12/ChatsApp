//
//  SettingsView.swift
//  chatsApp
//
//  Created by Andy Cao on 2021/11/12.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground).ignoresSafeArea()
            
            VStack(spacing: 32){
                HStack{
                    Image(systemName:"person").resizable()
                        .scaledToFill()
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())
                        .padding(.leading)
                    VStack(alignment: .leading, spacing: 4){
                        Text("Eddie Brock")
                            .font(.system(size: 18))
                        
                        Text("Available").foregroundColor(.gray).font(.system(size:14))
                    }
                    Spacer()
                }
                .frame(height: 80).background(Color.white)
                
                VStack(spacing: 1){
                    ForEach((0 ... 2), id: \.self){ _ in
                        SettingsCell()
                    }
                }
                Button(action: {print("handle log out here..")}, label: {
                    Text("Log Out").foregroundColor(.red).font(.system(size:16, weight: .semibold)).frame(width: UIScreen.main.bounds.width, height: 50).background(Color.white)
                })
                
                Spacer()
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
