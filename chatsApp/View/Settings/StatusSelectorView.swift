//
//  StatusSelector.swift
//  chatsApp
//
//  Created by Andy Cao on 2021/11/13.
//

import SwiftUI

struct StatusSelectorView: View {
    @ObservedObject var viewModel = StatusViewModel()
    var body: some View {
        ZStack{
            Color(.systemGroupedBackground).ignoresSafeArea()
            ScrollView{
                VStack(alignment: .leading){
                    Text("CURRENTLY SET TO").foregroundColor(.gray).padding()
                    StatusCell(status: viewModel.status)
                    Text("SLECT YOUR STATUS").foregroundColor(.gray).padding()
                    //for loop with options
                    VStack(spacing:1){
                        ForEach(UserStatus.allCases.filter({ $0 != .notConfigured}), id:\.self){ status in
                            Button(action:{
                                viewModel.updateStatus(status)
                            }, label:{
                                StatusCell(status : status)
                            })
                        }
                    }
                    
                }
            }
        }
    }
}

struct StatusSelector_Previews: PreviewProvider {
    static var previews: some View {
        StatusSelectorView()
    }
}

struct StatusCell: View {
    let status : UserStatus
    var body: some View {
        HStack{
            Text(status.title).foregroundColor(.black)
            Spacer()
        }.frame(height:56).padding(.horizontal).background(Color.white)
    }
}
