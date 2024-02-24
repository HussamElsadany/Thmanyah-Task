//
//  View+Extensions.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import SwiftUI

public struct OnLoadModifier: ViewModifier {
    
    @State private var hasLoaded = false
    let action: () -> Void
    
    public func body(content: Content) -> some View {
        content
            .onAppear {
                if !hasLoaded {
                    hasLoaded = true
                    action()
                }
            }
    }
}

public extension View {
    func onLoad(perform action: @escaping () -> Void) -> some View {
        self.modifier(OnLoadModifier(action: action))
    }
}
