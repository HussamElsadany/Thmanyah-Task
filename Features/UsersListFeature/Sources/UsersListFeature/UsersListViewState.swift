//
//  UsersListViewState.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

enum UsersListViewState {
    case loading
    case content(UserAdapter)
    
    var isLoading: Bool {
        switch self {
        case .content:
            return false
        case .loading:
            return true
        }
    }
}
