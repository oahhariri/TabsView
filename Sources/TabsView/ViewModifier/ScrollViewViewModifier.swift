//
//  ScrollViewViewModifier.swift
//

import SwiftUI


struct childScrollRTL: ViewModifier {
    let layoutDirection: LayoutDirection
    func body(content: Content) -> some View {
        content
            .environment(\.layoutDirection, .rightToLeft)
            .rotation3DEffect(Angle(degrees: layoutDirection == .rightToLeft ? 180 : 0), axis:
                                (x: CGFloat(0),
                                 y: CGFloat(layoutDirection == .rightToLeft ? 10 : 0),
                                 z: CGFloat(0)))
    }
}

struct ScrollRTL: ViewModifier {
    @Environment(\.layoutDirection) private var layoutDirection
    func body(content: Content) -> some View {
        content
            .flipsForRightToLeftLayoutDirection(true)
            .environment(\.layoutDirection, layoutDirection)
    }
}

extension View {
    func supportRTLScrollViewChild (layoutDirection: LayoutDirection ) -> some View {
        modifier(childScrollRTL(layoutDirection: layoutDirection ))
    }
    
    func supportRTLScrollView () -> some View {
        modifier(ScrollRTL())
    }
}

