//
//  Landmark.swift
//  Landmarks
//
//  Created by user on 2021/07/18.
//
//データ読み込み専用のファイル
//読み込みはSwift Fileで定義することができる

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable,Codable,Identifiable{
    var id :Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite:Bool
    var isFeatured:Bool
    
    var category: Category
    enum Category: String ,CaseIterable,Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    private var imageName: String
    var image: Image{
        Image(imageName)
    }
    
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
    
    private var coordinates:Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    
    //Coordinateの型を定義している。
    //のちに変更ができないようにするために、structで定義
    //latitudeとlongtitudeは浮動小数になるためDouble
    struct Coordinates: Hashable,Codable {
        var latitude: Double
        var longitude: Double
    }
}