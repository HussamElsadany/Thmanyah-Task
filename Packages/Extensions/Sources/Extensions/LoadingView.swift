//
//  LoadingView.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import SwiftUI

public struct LoadingView: View {
    
    public init () { }
    
    public var body: some View {
        ZStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .red))
                .scaleEffect(1.5)
        }
    }
}
