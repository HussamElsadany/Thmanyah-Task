//
//  UsersRepositoryProtocol.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

public protocol UsersRepositoryProtocol {
    
    /// Asynchronously retrieves a list of users.
    ///
    /// `GET /users`
    ///
    /// - Returns: An array of `UserEntity` objects, each representing a user.
    /// - Throws: An error if the request fails or data cannot be decoded.
    func getUsers() async throws -> [UserEntity]
}
