//
//  AlbumsUseCase.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

// MARK: - AlbumsUseCaseProtocol
public protocol AlbumsUseCaseProtocol {
    
    /// Asynchronously fetches a collection of user albums.
    ///
    /// - Parameter userId: The unique identifier for the user whose albums are being requested.
    /// - Returns: An array of `AlbumsEntity` objects, each representing an album associated with the provided `userId`.
    /// - Throws: An error if the request fails, if there's a network issue, or if the response data cannot be decoded into the expected format.
    func getAlbums(
        userId: Int
    ) async throws -> [AlbumsEntity]
}

// MARK: - AlbumsUseCase
public final class AlbumsUseCase {
    
    // MARK: Private Properties
    let repository: AlbumsRepositoryProtocol
    
    // MARK: Initialization
    public init(repository: AlbumsRepositoryProtocol) {
        self.repository = repository
    }
}

extension AlbumsUseCase: AlbumsUseCaseProtocol {
    public func getAlbums(
        userId: Int
    ) async throws -> [AlbumsEntity] {
        try await repository.getAlbums(userId: userId)
    }
}
