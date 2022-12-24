//
//  Utiltis.swift
//  
//

import UIKit
import SwiftUI
import Foundation

class Utiltis {
    
    static func safeAreaInsets() -> UIEdgeInsets {
        
        guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        
        guard let window = firstScene.windows.first else {
            return .zero
        }
        
        return window.safeAreaInsets
    }
    
}
