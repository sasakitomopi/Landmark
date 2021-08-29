//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by user on 2021/07/18.
//

import SwiftUI

@main
struct LandmarksApp: App {
    
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
