//
//  EditProfileView.swift
//  chatsApp
//
//  Created by Andy Cao on 2021/11/13.
//

import SwiftUI

struct EditProfileView: View {
    @State private var fullname = "Andy"
    var body: some View {
        ZStack{
            Color(.systemGroupedBackground).ignoresSafeArea()
            VStack(alignment: .leading, spacing: 44){
                //header with photo and eidt button
                VStack{
                    HStack{
                        VStack{
                            Image("account_img").resizable()
                                .scaledToFit()
                                .frame(width: 64, height:64)
                                .clipShape(Circle())
                            Button(action: {print("change profile")}, label:{Text("Edit")})
                        }.padding(.top)
                        Text("Enter your name or change your profile photo").font(.system(size:16)).foregroundColor(.gray).padding([.bottom, .horizontal])
                    }
                    Divider().padding(.horizontal)
                    TextField("", text: $fullname)
                        .padding(8)
                }.background(Color.white)
                
                //status
                VStack(alignment:.leading){
                    //status text
                    Text("Status").padding().foregroundColor(.gray)
                    //status
                    NavigationLink(destination: StatusSelectorView(), label: {
                        HStack{
                        Text("At the Movies")
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right").foregroundColor(.gray)
                    }.padding().background(Color.white)
                        
                    })
                }
                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle("Edit Profile")
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
