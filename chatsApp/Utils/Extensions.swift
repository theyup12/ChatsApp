//
//  Extensions.swift
//  chatsApp
//
//  Created by Andy Cao on 2021/11/22.
//

import UIKit

extension UIApplication{
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
    }
}
