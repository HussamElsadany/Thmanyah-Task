//
//  ViewState.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

public enum ViewState<Content> {
    
    case loading
    case content(Content)
    
    var isLoading: Bool {
        switch self {
        case .content:
            return false
        case .loading:
            return true
        }
    }
}
