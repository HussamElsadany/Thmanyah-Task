//
//  Mocks.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import Domain

class MockUsersRepository: UsersRepositoryProtocol {
    var users: [UserEntity]?
    var error: Error?
    
    func getUsers() async throws -> [UserEntity] {
        if let error = error {
            throw error
        }
        return users ?? []
    }
}

class MockAlbumsRepository: AlbumsRepositoryProtocol {
    var albums: [AlbumEntity]?
    var error: Error?
    
    func getAlbums(userId: Int) async throws -> [AlbumEntity] {
        if let error = error {
            throw error
        }
        return albums ?? []
    }
}

class MockPhotosRepository: PhotosRepositoryProtocol {
    var photos: [PhotoEntity]?
    var error: Error?
    
    func getPhotos(albumId: Int) async throws -> [PhotoEntity] {
        if let error = error {
            throw error
        }
        return photos ?? []
    }
}
