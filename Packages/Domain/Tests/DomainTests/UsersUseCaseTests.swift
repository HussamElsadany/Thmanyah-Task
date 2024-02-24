//
//  UsersUseCaseTests.swift
//  
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import XCTest
import Domain

final class UsersUseCaseTests: XCTestCase {
    
    func testGetUsersSuccess() async throws {
        // Setup
        let mockRepository = MockUsersRepository()
        let useCase = UsersUseCase(repository: mockRepository)
        let expectedUsers: [UserEntity] = [.mock]
        mockRepository.users = expectedUsers
        
        // Execute
        let users = try await useCase.getUsers()
        
        // Verify
        XCTAssertEqual(users, expectedUsers, "The returned users should match the expected users.")
    }
    
    func testGetUsersFailure() async {
        // Setup
        let mockRepository = MockUsersRepository()
        let useCase = UsersUseCase(repository: mockRepository)
        let expectedError = NSError(domain: "TestError", code: -1, userInfo: nil)
        mockRepository.error = expectedError
        
        do {
            // Execute
            _ = try await useCase.getUsers()
            XCTFail("Expected an error to be thrown, but getUsers completed successfully.")
        } catch {
            // Verify
            XCTAssertEqual(error as NSError, expectedError, "The thrown error should match the expected error.")
        }
    }
}
