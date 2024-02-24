//
//  AlbumsRepositoryProtocol.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

/// `AlbumsRepositoryProtocol` outlines the required operations for an albums repository,
/// including fetching users, albums, and photos. It leverages Swift's `async/await` model
/// for asynchronous operations, providing a modern and efficient approach to handling
/// network or database calls.
///
public protocol AlbumsRepositoryProtocol {
    
    /// Asynchronously retrieves a list of users.
    ///
    /// `GET /users`
    ///
    /// - Returns: An array of `UsersEntity` objects, each representing a user.
    /// - Throws: An error if the request fails or data cannot be decoded.
    func getUsers() async throws -> [UsersEntity]
    
    /// Asynchronously fetches a collection of albums.
    ///
    /// `GET /albums`
    ///
    /// - Returns: An array of `AlbumsEntity` objects, each detailing an album.
    /// - Throws: An error if the request fails or data cannot be decoded.
    func getAlbums() async throws -> [AlbumsEntity]
    
    /// Asynchronously obtains a series of photos.
    ///
    /// `GET /photos`
    ///
    /// - Returns: An array of `PhotosEntity` objects, with each representing a photo.
    /// - Throws: An error if the request fails or data cannot be decoded.
    func getPhotos() async throws -> [PhotosEntity]
}
