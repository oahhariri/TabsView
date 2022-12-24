//
//  TabBarItem.swift
//  
//

import SwiftUI

public enum TabBarItemSelectionStyle {
    case normal
    case underLine
}

struct TabBarItem<Selection:TabBarItemType>: View {
    
    @Binding private var currentTab: Selection
    private var tab: Selection
    
    init (tab: Selection, currentTab: Binding<Selection>) {
        _currentTab = currentTab
        self.tab = tab
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            
            Image(tab.icon)
                .resizable()
                .scaledToFit()
                .frame(width: tab.itemSize, height: tab.itemSize, alignment: .center)
                .foregroundColor(  currentTab != tab ? tab.itemColor : tab.selectionColor)
   
            
            if !tab.title.isEmpty {
                Text(tab.title)
                    .font(tab.font)
                    .foregroundColor(  currentTab != tab ? tab.itemColor : tab.selectionColor)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .lineLimit(1)
            }
          
            if tab.selectionStyle == .underLine {
                Rectangle()
                    .frame(width: 10, height: 3, alignment: .center)
                    .foregroundColor(tab.selectionColor)
                    .background(tab.selectionColor)
                    .opacity(currentTab == tab ? 1.0 : 0.0)
            }
            
 
        }
        .padding(.bottom, (Utiltis.safeAreaInsets().bottom / 2) )
        .background(Color.clear)
       
    }
    
    
}
