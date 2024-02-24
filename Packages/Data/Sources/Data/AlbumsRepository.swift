//
//  AlbumsRepository.swift
//  
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import Domain
import CoreNetwork
import ThmanyahAPI

// MARK: - AlbumsRepository
public final class AlbumsRepository {
    
    // MARK: Private Properties
    private let netWork: NetworkClientProtocol
    
    // MARK: Initialization
    public init(netWork: NetworkClientProtocol) {
        self.netWork = netWork
    }
}

extension AlbumsRepository: AlbumsRepositoryProtocol {
    public func getAlbums(
        userId: Int
    ) async throws -> [AlbumEntity] {
        try await netWork.send(
            [AlbumEntity].self,
            endpoint: AlbumsEndpoint.getAlbums(userId: userId)
        )
    }
}
