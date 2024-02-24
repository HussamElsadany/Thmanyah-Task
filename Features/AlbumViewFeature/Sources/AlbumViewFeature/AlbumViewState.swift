//
//  AlbumViewState.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

public enum AlbumViewState {
    case loading
    case content([PhotoAdapter])
    
    var isLoading: Bool {
        switch self {
        case .content:
            return false
        case .loading:
            return true
        }
    }
}
