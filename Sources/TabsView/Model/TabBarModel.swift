//
//  TabBarModel.swift
//    

import SwiftUI

class TabBarModel<Selection:TabBarItemType>: ObservableObject {
    
    @Published var selectedTab:Selection?
    
    @Published var tabs:[Selection] = []
    @Published var activeTabs:[Selection] = []
    
    func addTab(_ tab: Selection) {
        guard tabs.firstIndex(of: tab) == nil else{return}
        tabs.insert(tab, at: 0)
        objectWillChange.send()
    }
    
    func addActiveTabs(_ tab: Selection) {
        
        activeTabs.removeAll { oldTab in
            return tab == oldTab
        }
     
        if activeTabs.count >= 2 {
            activeTabs.removeLast()
        }
        
        activeTabs.insert(tab, at: 0)
        objectWillChange.send()
    }
}

