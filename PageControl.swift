//
//  PageControl.swift
//  Landmarks
//
//  Created by user on 2021/08/21.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    var numberOfPages:Int
    @Binding var currentPage : Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)
        
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator:NSObject{
        var control : PageControl
        
        init(_ control : PageControl) {
            self.control = control
        }
        
        //senderは、アクションが起きたUI要素のオブジェクトが入る
        @objc //@objc method to update the current page binding.
        func updateCurrentPage(sender:UIPageControl){
            control.currentPage = sender.currentPage
        }
    }
}

