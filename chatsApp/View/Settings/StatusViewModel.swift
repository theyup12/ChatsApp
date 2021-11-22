//
//  StatusOptions.swift
//  chatsApp
//
//  Created by Andy Cao on 2021/11/13.
//

import SwiftUI

class StatusViewModel: ObservableObject {
    @Published var status: UserStatus = .notConfigured
    
    func updateStatus(_ status: UserStatus){
        self.status = status
    }
}
enum UserStatus : Int, CaseIterable{
    case notConfigured
    case Available
    case Busy
    case AtSchool
    case AtMovie
    case Atwork
    case batteryLow
    case meeting
    case gym
    case sleeping
    case urgentCallsOnly
    
    var title: String{
        switch self{
        case .notConfigured: return "Click here to update your status"
        case .Available: return "Available"
        case .Busy: return "Busy"
        case .AtSchool: return "At School"
        case .AtMovie: return "At the movies"
        case .Atwork: return "At work"
        case .batteryLow: return "Battery about to die"
        case .meeting: return "In a meeting"
        case .gym: return "At the gym"
        case .sleeping: return "Sleeping"
        case .urgentCallsOnly: return "Urgent calls only"
        }
    }
}
