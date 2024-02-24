//
//  UsersListBuilder.swift
//  
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import SwiftUI
import Domain

public struct UsersListBuilder {

    private init() { }
    
    @MainActor 
    public static func build(
        usersUseCase: UsersUseCaseProtocol,
        albumsUseCase: AlbumsUseCaseProtocol,
        navigationHandler: @escaping UsersListViewModel.NavigationActionHandler
    ) -> UIViewController {
        let viewModel = UsersListViewModel(
            usersUseCase: usersUseCase,
            albumsUseCase: albumsUseCase,
            navigationHandler: navigationHandler
        )
        let view = UsersListView(viewModel: .init(wrappedValue: viewModel))
        return UIHostingController(rootView: view)
    }
}
