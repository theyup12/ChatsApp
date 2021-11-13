//
//  StatusSelector.swift
//  chatsApp
//
//  Created by Andy Cao on 2021/11/13.
//

import SwiftUI

struct StatusSelectorView: View {
    var body: some View {
        ZStack{
            Color(.systemGroupedBackground).ignoresSafeArea()
            ScrollView{
                VStack(alignment: .leading){
                    Text("CURRENTLY SET TO").foregroundColor(.gray).padding()
                    StatusCell(viewModel: StatusViewModel(rawValue: 4)!)
                    Text("SLECT YOUR STATUS").foregroundColor(.gray).padding()
                    //for loop with options
                    VStack(spacing:1){
                        ForEach(StatusViewModel.allCases.filter({ $0 != .notConfigured}), id:\.self){ viewModel in
                            Button(action:{
                                print("change status here...")
                            }, label:{
                                StatusCell(viewModel : viewModel)
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
    let viewModel : StatusViewModel
    var body: some View {
        HStack{
            Text(viewModel.title).foregroundColor(.black)
            Spacer()
        }.frame(height:56).padding(.horizontal).background(Color.white)
    }
}
