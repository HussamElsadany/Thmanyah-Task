//
//  ZoomableImageViewState.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import SwiftUI

enum ZoomableImageViewState {
    case loading
    case content(Image)
    
    var isLoading: Bool {
        switch self {
        case .content:
            return false
        case .loading:
            return true
        }
    }
}
