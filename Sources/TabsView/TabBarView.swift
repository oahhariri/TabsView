//
//  TabBarView.swift
//
//

import SwiftUI
import Introspect
import UIKit

struct TabBarView<Selection:TabBarItemType> : ViewModifier {
    
    let id: Selection
    
    @EnvironmentObject var tabBarModel:TabBarModel<Selection>
    @State var activeTabs:[Selection] = []
    
    init(id: Selection) {
        self.id = id
    }
    
    func body(content: Content) -> some View {
        
        GeometryReader { geo in
            HStack{
                LazyHStack{
                    content
                        .frame(width: activeTabs.firstIndex(of: id) != nil ? geo.size.width : 0
                               ,height: activeTabs.firstIndex(of: id) != nil ? geo.size.height:0)
                        .enableChildViewsScroll()
                }
                .frame(width: activeTabs.firstIndex(of: id) != nil ? geo.size.width : 0
                       ,height: activeTabs.firstIndex(of: id) != nil ? geo.size.height:0)
                .enableChildViewsScroll()
            }
            .frame(width: geo.size.width  ,height:  geo.size.height)
        }
        .onReceive( tabBarModel.$activeTabs, perform: { newValue in
            activeTabs = newValue
        })
        .id(id)
        .onAppear {
            tabBarModel.addTab(id)
        }
      
    }
 
}
  

public extension View {
    
    func tabBarView<Selection:TabBarItemType>(_ id: Selection) -> some View {
        modifier(TabBarView(id: id))
    }
}



