//
//  Profile.swift
//  Landmarks
//
//  Created by user on 2021/08/18.
//

import Foundation

struct Profile {
    var username: String
    var prefesNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "g_kumar")
    
    enum Season:String,CaseIterable,Identifiable{
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍁"
        case winter = "⛄️"
        
        var id:String {self.rawValue}
    }
}
