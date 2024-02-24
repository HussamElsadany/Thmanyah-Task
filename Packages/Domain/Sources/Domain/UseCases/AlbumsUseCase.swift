//
//  AlbumsUseCase.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

// MARK: - AlbumsUseCaseProtocol
public protocol AlbumsUseCaseProtocol {
    
    /// Asynchronously fetches a collection of albums.
    ///
    /// - Returns: An array of `AlbumsEntity` objects, each detailing an album.
    /// - Throws: An error if the request fails or data cannot be decoded.
    func getAlbums() async throws -> [AlbumsEntity]
}

// MARK: - AlbumsUseCase
public final class AlbumsUseCase {
    
    let repository: AlbumsRepositoryProtocol
    
    public init(repository: AlbumsRepositoryProtocol) {
        self.repository = repository
    }
}

extension AlbumsUseCase: AlbumsUseCaseProtocol {
   public func getAlbums() async throws -> [AlbumsEntity] {
        try await repository.getAlbums()
    }
}
