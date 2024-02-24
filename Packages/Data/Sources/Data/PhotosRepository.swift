//
//  PhotosRepository.swift
//  
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import Domain
import CoreNetwork
import ThmanyahAPI

// MARK: - PhotosRepository
public final class PhotosRepository {
    
    // MARK: Private Properties
    private let netWork: NetworkClientProtocol
    
    // MARK: Initialization
    public init(netWork: NetworkClientProtocol) {
        self.netWork = netWork
    }
}

extension PhotosRepository: PhotosRepositoryProtocol {
    public func getPhotos(
        albumId: Int
    ) async throws -> [PhotosEntity] {
        try await netWork.send(
            [PhotosEntity].self,
            endpoint: PhotosEndpoint.getPhotos(albumId: albumId)
        )
    }
}
