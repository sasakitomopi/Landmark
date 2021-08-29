//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by user on 2021/08/18.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData :ModelData
    var profile: Profile
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 10){
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Notifications: \(profile.prefesNotifications ? "On":"Off")")
                Text("Seasonal Photos:\(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate,style:.date)
                
                Divider()
                
                VStack(alignment: .leading){
                    Text("Comoleted Badges")
                        .font(.headline)
                    
                    ScrollView(.horizontal){
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                //色相回転
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tentj Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                            
                        }
                        .padding(.bottom)
                    }
                }
                
                Divider()
                VStack(alignment: .leading){
                    Text("Recent Hikes")
                        .font(.headline)
                    
                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
