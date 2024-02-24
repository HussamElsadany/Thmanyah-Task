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
    /// - Returns: An array of `PhotosEntity` objects, with each representing a photo.
    /// - Throws: An error if the request fails or data cannot be decoded.
    func getPhotos() async throws -> [PhotosEntity]
}

// MARK: - PhotosUseCase
public final class PhotosUseCase {
    
    let repository: PhotosRepositoryProtocol
    
    public init(repository: PhotosRepositoryProtocol) {
        self.repository = repository
    }
}

extension PhotosUseCase: PhotosUseCaseProtocol {
    public func getPhotos() async throws -> [PhotosEntity] {
        try await repository.getPhotos()
    }
}
