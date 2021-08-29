//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by user on 2021/07/24.
//

import SwiftUI

struct LandmarkRow: View {
    //Landmark.swiftで定義しLandmarkを再定義
    var landmark : Landmark
    
    var body: some View {
        HStack{
            landmark.image
                .resizable()
                .frame(width:50,height:50)
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    
    static var landmarks = ModelData().landmarks
    
        static var previews: some View{
        
        Group{
            //JSONファイルの一行目を呼び出すためのコード
            LandmarkRow(landmark:landmarks[0])
            
            //JSONファイルの二行目を呼び出すためのコード
            LandmarkRow(landmark:landmarks[1])
                
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
