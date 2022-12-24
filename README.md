
## TabsView

TabsView, is an alternative to native apple tabview.

TabsView is purely written in SwiftUI. it is used like apples tabview but with more customization

Requirements
* iOS 14.0+
* Xcode 12+
* Swift 5.5+

## Features

* Keep views state when change between tab.
* Lazy View load, only view shown on screen is loaded.
* Animate Tabs changes.
* Customize tabBar or you can hide the default tabBar to replace it with custom implementation.
* Purely written in SwiftUI.


## Setup

* SPM 

 ```
https://github.com/oahhariri/TabsView.git
 ```
* Cocopods 

 ```
pod 'TabsView', '~> 1.0.1'
```
 
## Main Compnents  
- TabBarItemType
- TabBarView 

### TabBarItemType 
is a protocol that define the tabs and will handel style and selection behaviour 

```
protocol TabBarItemType: Identifiable, CaseIterable,Equatable,Hashable {
    
    associatedtype Id
    var id: Id {get}
    
    var icon: String {get}
    var title: String {get}
    var selectionStyle: TabBarItemSelectionStyle {get}
    var selectionColor: Color {get}
    var itemColor: Color {get}
    var itemSize: CGFloat {get}
    
}
```

### TabBarView 
is a warper for your views, any view inside the tabsView need to be warper with TabBarView

```
View1()
   .tabBarView(MainTabBar.View1)
```

## Usage

- First you need to implement TabBarItemType to identify your tabs. 


```
enum MainTabBar: TabBarItemType {

    case View1
    case View2
    case View3
    case View4
}
```


```
extension MainTabBar: TabBarItemType {
    
    var id: TabBarItems {
        return self
    }
    
    var icon: String {
        switch self {
        case .View1:
            return "Icon1"
        case .View2:
            return "Icon2"
        case .View3:
            return "Icon3"
        case .View4:
            return "Icon4"
        }
    }
    
    var selectionStyle: TabBarItemSelectionStyle { .underLine }
    var selectionColor: Color {  Color.brandColors.main  }
    var itemColor: Color { Color.uiColos.faded }
    var itemSize: CGFloat { 22 } 
}
 ```
 
- Now you are ready to use the  TabsView 
```
@State var currentTab: MainTabBar
 
TabsView(selection: $currentTab) {
    
    View1()
        .tabBarView(MainTabBar.View1)
    
    View2()
        .tabBarView(MainTabBar.View1)
     
    View3()
        .tabBarView(MainTabBar.View1)
}
```

## TabsView Custmaization

- change tabs with animation
```  
TabsView(selection: $currentTab) { 
     ...
}
.changeTabWithAnimation(true)
```

- change Tabbar color & Height
```  
TabsView(selection: $currentTab) { 
     ...
}
.tabBarColor(Color.white)
.tabBarHeight(45)
```


- Hide Tabbar
```  
TabsView(selection: $currentTab) { 
     ...
}
.hideTabBar(true)
```
