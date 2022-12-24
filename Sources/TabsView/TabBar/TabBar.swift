//
//  File.swift
//  
//
//  Created by Abdulrahman Hariri on 23/12/2022.
//

import SwiftUI

struct TabBar<Selection:TabBarItemType>: View {
    
    private var tabs: [Selection]
    @Binding private var currentTab: Selection
    
    private let tabBarColor:Color
    
    
    init (tabBarColor:Color, currentTab: Binding<Selection>,tabs: [Selection]) {
        _currentTab = currentTab
        self.tabs = tabs
        self.tabBarColor = tabBarColor
    }
    
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                HStack(alignment: .center) {
                    ForEach(tabs,id: \.self) { tab in
                        TabBarItem(tab: tab, currentTab: $currentTab)
                            .frame(width:geometry.size.width / CGFloat(tabs.count + 1), alignment: .center)
                            .frame(maxHeight: .infinity, alignment: .center)
                            .onTapGesture {
                                self.currentTab = tab
                            }
                    }
                }
                .frame( width: geometry.size.width, alignment: .center)
                .frame(maxHeight: .infinity, alignment: .center)
                .background(tabBarColor)
            }
            .frame( width: geometry.size.width, alignment: .center)
            .frame(maxHeight: .infinity, alignment: .center)
            .background(tabBarColor.shadow(color: .gray.opacity(0.1), radius: 8, x: 0, y: -3))
        }
        .frame(maxHeight: .infinity, alignment: .center)
    }
    
}

 

