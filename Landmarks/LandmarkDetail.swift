//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by user on 2021/07/24.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData :ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int{
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        ScrollView {
            // ここでMapViewに引数として座標の値を渡している。
            MapView(coordinate:  landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            //ここでCircleImageに画像名を渡している。
            CircleImage(image : landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack{
                    Text(landmark.name)
                        .font(.title)
                        .foregroundColor(.primary)
                    FavoriteButton(isSet:$modelData.landmarks[landmarkIndex].isFavorite)
                }
              
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            
            
            .navigationTitle(landmark.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0])
    }
}
