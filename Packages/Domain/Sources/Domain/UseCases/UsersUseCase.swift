//
//  UsersUseCase.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

// MARK: - UsersUseCaseProtocol
public protocol UsersUseCaseProtocol {
    
    /// Asynchronously retrieves a list of users.
    ///
    /// - Returns: An array of `UsersEntity` objects, each representing a user.
    /// - Throws: An error if the request fails or data cannot be decoded.
    func getUsers() async throws -> [UsersEntity]
}

// MARK: - UsersUseCase
public final class UsersUseCase {
    
    let repository: UsersRepositoryProtocol
    
    public init(repository: UsersRepositoryProtocol) {
        self.repository = repository
    }
}

extension UsersUseCase: UsersUseCaseProtocol {
    public func getUsers() async throws -> [UsersEntity] {
        try await repository.getUsers()
    }
}
