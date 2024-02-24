//
//  AlbumsRepositoryTests.swift
//  
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import XCTest
import Data
import Domain

final class AlbumsRepositoryTests: XCTestCase {
    
    func testGetAlbumsSuccess() async throws {
        // Setup
        let mockNetworkClient = MockNetworkClient()
        let repository = AlbumsRepository(netWork: mockNetworkClient)
        let expectedAlbums: [AlbumEntity] = [.mock, .mock]
        mockNetworkClient.result = expectedAlbums
        
        // Execute
        let albums = try await repository.getAlbums(userId: 1)
        
        // Verify
        XCTAssertEqual(albums.count, expectedAlbums.count)
        XCTAssertEqual(albums.first?.id, expectedAlbums.first?.id)
        XCTAssertEqual(albums.first?.title, expectedAlbums.first?.title)
    }
    
    func testGetAlbumsFailure() async {
        // Setup
        let mockNetworkClient = MockNetworkClient()
        let repository = AlbumsRepository(netWork: mockNetworkClient)
        mockNetworkClient.error = NSError(domain: "TestError", code: -1, userInfo: nil)
        
        do {
            // Execute
            _ = try await repository.getAlbums(userId: 1)
            XCTFail("Expected an error to be thrown")
        } catch {
            // Verify
            XCTAssertNotNil(error)
        }
    }
}
