//
//  PhotosUseCaseTests.swift
//  
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import XCTest
import Domain

final class PhotosUseCaseTests: XCTestCase {
    
    func testGetPhotosSuccess() async throws {
        // Setup
        let mockRepository = MockPhotosRepository()
        let useCase = PhotosUseCase(repository: mockRepository)
        let expectedPhotos: [PhotoEntity] = [.mock]
        mockRepository.photos = expectedPhotos
        
        // Execute
        let photos = try await useCase.getPhotos(albumId: 1)
        
        // Verify
        XCTAssertEqual(photos, expectedPhotos, "The returned photos should match the expected photos.")
    }
    
    func testGetPhotosFailure() async {
        // Setup
        let mockRepository = MockPhotosRepository()
        let useCase = PhotosUseCase(repository: mockRepository)
        let expectedError = NSError(domain: "TestError", code: 404, userInfo: nil)
        mockRepository.error = expectedError
        
        do {
            // Execute
            _ = try await useCase.getPhotos(albumId: 1)
            XCTFail("Expected an error to be thrown, but getPhotos completed successfully.")
        } catch {
            // Verify
            XCTAssertEqual(error as NSError, expectedError, "The thrown error should match the expected error.")
        }
    }
}
