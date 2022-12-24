//
//  ViewModifier.swift
//  
//
//  Created by Abdulrahman Hariri on 23/12/2022.
//

import SwiftUI
import Introspect


struct TabBarDisabledScroll : ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .scrollDisabled(true)
            
        } else {
            content
                .introspectScrollView { scrollview in
                    scrollview.isScrollEnabled = false
                    scrollview.alwaysBounceVertical = false
                    scrollview.alwaysBounceHorizontal = false
                }
        }
        
        
    }
}



struct TabBarEnableChildViewsScroll : ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .environment(\.isScrollEnabled , true)
        } else {
            content
        }
        
    }
}


extension View {
    func disabledScroll() -> some View {
        modifier(TabBarDisabledScroll())
    }
    
    func enableChildViewsScroll () -> some View {
        modifier(TabBarEnableChildViewsScroll())
    }
  
}
