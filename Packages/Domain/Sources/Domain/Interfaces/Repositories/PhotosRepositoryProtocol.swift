//
//  PhotosRepositoryProtocol.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

public protocol PhotosRepositoryProtocol {
    
    /// Asynchronously obtains a series of photos.
    ///
    /// `GET /photos?albumId=`
    ///
    /// - Parameter albumId: The unique identifier for the album whose photos are being requested.
    /// - Returns: An array of `PhotoEntity` objects, each representing a photo belonging to the specified album.
    /// - Throws: An error if the request fails due to network issues, if the album ID does not exist, or if the response data cannot be decoded into the array of `PhotoEntity`.
    func getPhotos(
        albumId: Int
    ) async throws -> [PhotoEntity]
}
