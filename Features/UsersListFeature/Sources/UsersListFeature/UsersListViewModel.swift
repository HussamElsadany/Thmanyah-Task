//
//  UsersListViewModel.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import Domain
import Foundation

// MARK: - UsersListViewModel
final public class UsersListViewModel: ObservableObject {
    
    // MARK: Private Properties
    private let navigationHandler: NavigationActionHandler
    
    // MARK: UseCase
    private let usersUseCase: UsersUseCaseProtocol
    private let albumsUseCase: AlbumsUseCaseProtocol
    
    // MARK: Initialization
    init(
        usersUseCase: UsersUseCaseProtocol,
        albumsUseCase: AlbumsUseCaseProtocol,
        navigationHandler: @escaping NavigationActionHandler
    ) {
        self.usersUseCase = usersUseCase
        self.albumsUseCase = albumsUseCase
        self.navigationHandler = navigationHandler
    }
}


extension UsersListViewModel {
        
}

// MARK: - Navigation
extension UsersListViewModel {
    public typealias NavigationActionHandler = (UsersListViewModel.NavigationAction) -> Void
    
    public enum NavigationAction {
        case openPhotos(albumId: Int)
    }
}
