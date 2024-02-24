//
//  AlbumsRepositoryProtocol.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

public protocol AlbumsRepositoryProtocol {
    
    /// Asynchronously fetches a collection of albums.
    ///
    /// `GET /albums?userId=`
    ///
    /// - Parameter userId: The unique identifier for the user whose albums are being requested.
    /// - Returns: An array of `AlbumsEntity` objects, each representing an album associated with the provided `userId`.
    /// - Throws: An error if the request fails, if there's a network issue, or if the response data cannot be decoded into the expected format.
    func getAlbums(
        userId: Int
    ) async throws -> [AlbumsEntity]
}
