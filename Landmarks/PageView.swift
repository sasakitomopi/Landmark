//
//  PageView.swift
//  Landmarks
//
//  Created by user on 2021/08/21.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages:[Page]
    @State private var currentPage = 0// 参照される側のプロパティ定義
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            // 参照する側: PageViewControllerに渡している
            PageViewController(pages:pages,currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width:CGFloat(pages.count * 18))
                .padding(.trailing)
        }
        
        VStack{
            Text("Current Page: \(currentPage)")
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map{FeatureCard(landmark: $0)})
                    .aspectRatio(3/2,contentMode: .fit)
    }
}
