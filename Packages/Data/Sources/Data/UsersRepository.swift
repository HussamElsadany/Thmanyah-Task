//
//  UsersRepository.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import Domain
import CoreNetwork
import ThmanyahAPI

// MARK: - PhotosRepository
public final class UsersRepository {
    
    // MARK: Private Properties
    private let netWork: NetworkClientProtocol
    
    // MARK: Initialization
    public init(netWork: NetworkClientProtocol) {
        self.netWork = netWork
    }
}

extension UsersRepository: UsersRepositoryProtocol {
    public func getUsers() async throws -> [UsersEntity] {
        try await netWork.send(
            [UsersEntity].self,
            endpoint: UsersEndpoint.getUsers
        )
    }
}
