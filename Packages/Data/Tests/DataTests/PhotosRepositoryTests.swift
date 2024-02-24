//
//  PhotosRepositoryTests.swift
//  
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import XCTest
import Data
import Domain

final class PhotosRepositoryTests: XCTestCase {
    
    func testGetPhotosSuccess() async throws {
        // Setup
        let mockNetworkClient = MockNetworkClient()
        let repository = PhotosRepository(netWork: mockNetworkClient)
        let expectedPhotos: [PhotoEntity] = [.mock]
        mockNetworkClient.result = expectedPhotos
        
        // Execute
        let photos = try await repository.getPhotos(albumId: 123)
        
        // Verify
        XCTAssertEqual(photos.count, expectedPhotos.count, "The number of photos should match the expected count.")
        XCTAssertEqual(photos.first?.id, expectedPhotos.first?.id, "The photo IDs should match.")
        XCTAssertEqual(photos.first?.title, expectedPhotos.first?.title, "The photo titles should match.")
    }
    
    func testGetPhotosFailure() async {
        // Setup
        let mockNetworkClient = MockNetworkClient()
        let repository = PhotosRepository(netWork: mockNetworkClient)
        mockNetworkClient.error = NSError(domain: "TestError", code: -1, userInfo: nil)
        
        do {
            // Execute
            _ = try await repository.getPhotos(albumId: 123)
            XCTFail("Expected an error to be thrown, but getPhotos completed successfully.")
        } catch {
            // Verify
            XCTAssertNotNil(error, "getPhotos should have thrown an error.")
        }
    }
}
