//
//  AlbumsRepositoryProtocol.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

public protocol AlbumsRepositoryProtocol {
    
    /// Asynchronously fetches a collection of albums.
    ///
    /// `GET /albums`
    ///
    /// - Returns: An array of `AlbumsEntity` objects, each detailing an album.
    /// - Throws: An error if the request fails or data cannot be decoded.
    func getAlbums() async throws -> [AlbumsEntity]
}
