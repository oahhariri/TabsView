//
//  TabBarItemType.swift
//

import SwiftUI

public protocol TabBarItemType: Identifiable, CaseIterable,Equatable,Hashable {
    
    associatedtype Id
    var id: Id {get}
    
    var icon: String {get}
    var title: String {get}
    var selectionStyle: TabBarItemSelectionStyle {get}
    var selectionColor: Color {get}
    var itemColor: Color {get}
    var itemSize: CGFloat {get}
    var font: Font {get}
}

public extension TabBarItemType {
   var selectionStyle: TabBarItemSelectionStyle {
       get { .normal }
   }
    var selectionColor: Color {
        get { .accentColor}
    }
    var itemColor: Color {
        get { .gray }
    }
    var itemSize: CGFloat {
        get { 22 }
    }
    var title: String {
        get { "" }
    }
     
    var icon: String {
        get { "" }
    }
    
    var font: Font {
        get { .system(size: 8,weight: .bold) }
    }
     
     
}
 
