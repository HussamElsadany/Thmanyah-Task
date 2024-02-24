//
//  UsersRepositoryTests.swift
//  
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import XCTest
import Data
import Domain

final class UsersRepositoryTests: XCTestCase {
    
    func testGetUsersSuccess() async throws {
        // Setup
        let mockNetworkClient = MockNetworkClient()
        let repository = UsersRepository(netWork: mockNetworkClient)
        let expectedUsers: [UserEntity] = [.mock]
        mockNetworkClient.result = expectedUsers
        
        // Execute
        let users = try await repository.getUsers()
        
        // Verify
        XCTAssertEqual(users.count, expectedUsers.count, "The number of users should match the expected count.")
        XCTAssertEqual(users.first?.id, expectedUsers.first?.id, "The user IDs should match.")
        XCTAssertEqual(users.first?.name, expectedUsers.first?.name, "The user names should match.")
    }
    
    func testGetUsersFailure() async {
        // Setup
        let mockNetworkClient = MockNetworkClient()
        let repository = UsersRepository(netWork: mockNetworkClient)
        mockNetworkClient.error = NSError(domain: "TestError", code: -1, userInfo: nil)
        
        do {
            // Execute
            _ = try await repository.getUsers()
            XCTFail("Expected an error to be thrown, but getUsers completed successfully.")
        } catch {
            // Verify
            XCTAssertNotNil(error, "getUsers should have thrown an error.")
        }
    }
}
