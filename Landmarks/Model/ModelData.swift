//
//  ModelData.swift
//  Landmarks
//
//  Created by user on 2021/07/18.
//

import Foundation
import Combine
final class ModelData : ObservableObject {
    
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes :[Hike] = load("hikeData.json")
    @Published var profile = Profile.default
    
    var features:[Landmark]{
        landmarks.filter { $0.isFeatured}
    }
    
    var categories: [String: [Landmark]]{
        Dictionary(
            grouping: landmarks,
            by:{ $0.category.rawValue})
    }
}

//使用しているloadの中身を定義。データの入ったjsonファイルが引数として渡される(引数：landmarkData.json)
func load<T: Decodable>(_ filename: String)->T{
    
    let data: Data
    
    //guardはif文と同じような使われかたをする
    guard  let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle .")
    }
    
    do {
        data = try Data(contentsOf:file)
    }catch{
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do{
        //Jsonのデコーダを作ってdataに格納されたデータをデコード(機械語に戻す)
        let  decoder = JSONDecoder()
        return try decoder.decode(T.self,from:data)
        
    }catch{
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
    
}



