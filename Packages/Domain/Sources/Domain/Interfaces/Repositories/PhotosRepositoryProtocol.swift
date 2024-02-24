//
//  PhotosRepositoryProtocol.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

public protocol PhotosRepositoryProtocol {
    
    /// Asynchronously obtains a series of photos.
    ///
    /// `GET /photos`
    ///
    /// - Returns: An array of `PhotosEntity` objects, with each representing a photo.
    /// - Throws: An error if the request fails or data cannot be decoded.
    func getPhotos() async throws -> [PhotosEntity]
}
