//
//  CircleImage.swift
//  Landmarks
//
//  Created by user on 2021/07/18.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image(/*@START_MENU_TOKEN@*/"turtlerock"/*@END_MENU_TOKEN@*/)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(Color.white,lineWidth: 4))
            .shadow(radius:7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
