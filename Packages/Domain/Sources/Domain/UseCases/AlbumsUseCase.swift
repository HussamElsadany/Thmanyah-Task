//
//  AlbumsUseCase.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

public protocol AlbumsUseCaseProtocol {
    
    /// Asynchronously retrieves a list of users.
    ///
    /// - Returns: An array of `UsersEntity` objects, each representing a user.
    /// - Throws: An error if the request fails or data cannot be decoded.
    func getUsers() async throws -> [UsersEntity]
    
    /// Asynchronously fetches a collection of albums.
    ///
    /// - Returns: An array of `AlbumsEntity` objects, each detailing an album.
    /// - Throws: An error if the request fails or data cannot be decoded.
    func getAlbums() async throws -> [AlbumsEntity]
    
    /// Asynchronously obtains a series of photos.
    ///
    /// - Returns: An array of `PhotosEntity` objects, with each representing a photo.
    /// - Throws: An error if the request fails or data cannot be decoded.
    func getPhotos() async throws -> [PhotosEntity]
}

public struct AlbumsUseCase {
    
    let repository: AlbumsRepositoryProtocol
    
    init(repository: AlbumsRepositoryProtocol) {
        self.repository = repository
    }
}

extension AlbumsUseCase: AlbumsUseCaseProtocol {
    public func getUsers() async throws -> [UsersEntity] {
        try await repository.getUsers()
    }
    
    public func getAlbums() async throws -> [AlbumsEntity] {
        try await repository.getAlbums()
    }
    
    public func getPhotos() async throws -> [PhotosEntity] {
        try await repository.getPhotos()
    }
}
