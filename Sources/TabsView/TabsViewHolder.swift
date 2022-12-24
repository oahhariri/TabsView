//
//  TabsViewHolder.swift
//


import SwiftUI
import Introspect


struct TabsViewHolder<Selection:TabBarItemType, Content:View>: View {
   
   @Binding var selection: Selection
   @ViewBuilder var content: (ScrollViewProxy, GeometryProxy) -> Content
   
    
   init(selection: Binding<Selection>,  @ViewBuilder  _ content :@escaping (ScrollViewProxy, GeometryProxy) -> Content) {
       self._selection = selection
       self.content = content
       
   }
   
   
   var body: some View {
       GeometryReader { geometry in
           
           ScrollViewReader { scrollTo  in
               
               ScrollView(.horizontal,showsIndicators: false) {
                   HStack {
                       content (scrollTo,geometry)
                   }
                   .frame(height: geometry.size.height)
                   .frame(minWidth: geometry.size.width )
                   .disabledScroll()
               }
               .disabledScroll()
               
           }
           .supportRTLScrollView()
           
       }
   }
   
}

