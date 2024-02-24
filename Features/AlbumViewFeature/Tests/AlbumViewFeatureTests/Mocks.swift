//
//  Mocks.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import Domain
import AlbumViewFeature

class MockPhotosUseCase: PhotosUseCaseProtocol {
    var result: [PhotoEntity]?
    var error: Error?
    
    func getPhotos(albumId: Int) async throws -> [PhotoEntity] {
        if let error = error {
            throw error
        }
        return result ?? []
    }
}

class MockNavigationHandler {
    var lastAction: AlbumViewModel.NavigationAction?
    
    func handle(action: AlbumViewModel.NavigationAction) {
        lastAction = action
    }
}
