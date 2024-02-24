//
//  AlbumsUseCaseTests.swift
//  
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import XCTest
import Domain

final class AlbumsUseCaseTests: XCTestCase {
    
    func testGetAlbumsSuccess() async throws {
        // Setup
        let mockRepository = MockAlbumsRepository()
        let useCase = AlbumsUseCase(repository: mockRepository)
        let expectedAlbums: [AlbumEntity] = [.mock]
        mockRepository.albums = expectedAlbums
        
        // Execute
        let albums = try await useCase.getAlbums(userId: 123)
        
        // Verify
        XCTAssertEqual(albums, expectedAlbums, "The returned albums should match the expected albums.")
    }
    
    func testGetAlbumsFailure() async {
        // Setup
        let mockRepository = MockAlbumsRepository()
        let useCase = AlbumsUseCase(repository: mockRepository)
        let expectedError = NSError(domain: "TestError", code: 404, userInfo: nil)
        mockRepository.error = expectedError
        
        do {
            // Execute
            _ = try await useCase.getAlbums(userId: 123)
            XCTFail("Expected an error to be thrown, but getAlbums completed successfully.")
        } catch {
            // Verify
            XCTAssertEqual(error as NSError, expectedError, "The thrown error should match the expected error.")
        }
    }
}
