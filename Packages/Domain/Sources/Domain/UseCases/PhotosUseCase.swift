//
//  PhotosUseCase.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

// MARK: - PhotosUseCaseProtocol
public protocol PhotosUseCaseProtocol {
    
    /// Asynchronously obtains a series of photos.
    ///
    /// - Parameter albumId: The unique identifier for the album whose photos are being requested.
    /// - Returns: An array of `PhotoEntity` objects, each representing a photo belonging to the specified album.
    /// - Throws: An error if the request fails due to network issues, if the album ID does not exist, or if the response data cannot be decoded into the array of `PhotoEntity`.
    func getPhotos(
        albumId: Int
    ) async throws -> [PhotoEntity]
}

// MARK: - PhotosUseCase
public final class PhotosUseCase {
    
    // MARK: Private Properties
    let repository: PhotosRepositoryProtocol
    
    // MARK: Initialization
    public init(repository: PhotosRepositoryProtocol) {
        self.repository = repository
    }
}

extension PhotosUseCase: PhotosUseCaseProtocol {
    public func getPhotos(
        albumId: Int
    ) async throws -> [PhotoEntity] {
        try await repository.getPhotos(albumId: albumId)
    }
}
