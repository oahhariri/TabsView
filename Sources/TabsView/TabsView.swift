//
//  TabsView.swift
//


import SwiftUI
import Introspect

public struct TabsView <Selection:TabBarItemType, Content:View>: View {
    
    @StateObject private var tabBarModel:TabBarModel<Selection>
    @Binding private var selection: Selection
    
    private var changeTabWithAnimation: Bool = false
    private var tabBarHeight: CGFloat = 50.0
    private var tabBarBackgroundColor: Color = Color.white
    private var tabBarIsHidden: Bool = false
    
    let content: Content
    
    public init(selection: Binding<Selection>, @ViewBuilder _ content: () -> Content) {
        self._selection = selection
        _tabBarModel = .init(wrappedValue: TabBarModel())
        self.content = content()
    }
    
    
    @Environment(\.layoutDirection) private var layoutDirection
    
    public var body: some View {
        
        
        VStack(spacing: 0) {
            TabsViewHolder(selection: $selection) { (scrollTo, geometry) in
                
                HStack(spacing: 100) {
                    self.content
                        .frame(height: geometry.size.height)
                        .frame(minWidth: geometry.size.width )
                }
                .supportRTLScrollViewChild(layoutDirection: layoutDirection)
                .frame(height: geometry.size.height)
                .frame(minWidth: geometry.size.width )
                .onChange(of: selection) { newValue in
                    tabBarModel.addActiveTabs(newValue)
                    if changeTabWithAnimation {
                        withAnimation(.linear(duration: 0.1)) {
                            scrollTo.scrollTo(newValue)
                        }
                    } else {
                        scrollTo.scrollTo(newValue)
                    }
                     
                }
                .onAppear {
          
                    scrollTo.scrollTo(selection)
                 
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        tabBarModel.addActiveTabs(selection)
                    }
                }
                
            }
            
            if tabBarIsHidden == false {
              
                TabBar(tabBarColor: tabBarBackgroundColor, currentTab: $selection, tabs: tabBarModel.tabs)
                    .frame(height: tabBarHeight, alignment: .center)
                    
                
            }
            
        }
        .environmentObject(tabBarModel)
        .ignoresSafeArea(.all,edges: .bottom)
        
        
    }
}

public extension TabsView {
    func tabBarHeight (_ height:CGFloat) -> Self {
        var view = self
        view.tabBarHeight = height + Utiltis.safeAreaInsets().bottom
        return view
    }
    
    func tabBarColor (_ color :Color ) -> Self {
        var view = self
        view.tabBarBackgroundColor = color
        return view
    }
    
    func hideTabBar (_ isHidden :Bool ) -> Self {
        var view = self
        view.tabBarIsHidden = isHidden
        return view
    }
    
    func changeTabWithAnimation (_ animate :Bool ) -> Self {
        var view = self
        view.changeTabWithAnimation = animate
        return view
    }
    
}
