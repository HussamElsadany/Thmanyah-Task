//
//  Mocks.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import Domain
import UsersListFeature

class MockUsersUseCase: UsersUseCaseProtocol {
    var result: [UserEntity]?
    var error: Error?

    func getUsers() async throws -> [UserEntity] {
        if let error = error {
            throw error
        }
        return result ?? []
    }
}

class MockAlbumsUseCase: AlbumsUseCaseProtocol {
    var result: [AlbumEntity]?
    var error: Error?

    func getAlbums(userId: Int) async throws -> [AlbumEntity] {
        if let error = error {
            throw error
        }
        return result ?? []
    }
}

// Example handler that just stores the last navigation action
class MockNavigationHandler {
    var lastAction: UsersListViewModel.NavigationAction?

    func handle(action: UsersListViewModel.NavigationAction) {
        lastAction = action
    }
}
