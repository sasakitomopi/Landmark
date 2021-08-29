//
//  CategoryHome.swift
//  Landmarks
//
//  Created by user on 2021/08/16.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    
    
    var body: some View {
        NavigationView{
            List {
                PageView(pages: modelData.features.map{FeatureCard(landmark: $0)})
                    .aspectRatio(3/2,contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                //keys.sortedはキーを昇順にするよって意味
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    //[key]! これなに
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(InsetListStyle())
            .navigationTitle("Featured")
            .toolbar{
                Button(action: { showingProfile.toggle() }){
                    Image(systemName:"person.crop.circle")
                        .accessibilityLabel("User Profile")
                }
            }
            .sheet(isPresented: $showingProfile){
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
