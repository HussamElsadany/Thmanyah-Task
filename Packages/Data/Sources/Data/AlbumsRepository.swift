//
//  AlbumsRepository.swift
//  
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import Domain
import CoreNetwork

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
    public func getUsers() async throws -> [Domain.UsersEntity] {
        <#code#>
    }
    
    public func getAlbums() async throws -> [Domain.AlbumsEntity] {
        <#code#>
    }
    
    public func getPhotos() async throws -> [Domain.PhotosEntity] {
        <#code#>
    }
    
    
}
