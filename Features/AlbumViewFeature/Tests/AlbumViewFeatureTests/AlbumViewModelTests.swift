//
//  AlbumViewModelTests.swift
//  
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import XCTest
import Domain
import AlbumViewFeature

@MainActor
final class AlbumViewModelTests: XCTestCase {

    func testSuccessfulPhotoFetching() async throws {
        let album = AlbumEntity.mock
        let mockUseCase = MockPhotosUseCase()
        mockUseCase.result = [PhotoEntity.mock]
        
        let viewModel = AlbumViewModel(
            album: album,
            photosUseCase: mockUseCase,
            navigationHandler: {_ in })
        
        await viewModel.viewDidLoad()
        
        try await Task.sleep(nanoseconds: 1_000_000_000) // 1 second in nanoseconds
        
        switch viewModel.viewState {
        case .content(let photoAdapters):
            XCTAssertEqual(photoAdapters.count, 1)
            XCTAssertEqual(photoAdapters.first?.title, PhotoEntity.mock.title)
        default:
            XCTFail("Expected content state with fetched photos")
        }
    }
    
    func testErrorHandling() async throws {
        let album = AlbumEntity.mock
        let mockUseCase = MockPhotosUseCase()
        mockUseCase.error = NSError(domain: "TestError", code: -1, userInfo: nil)
        
        let viewModel = AlbumViewModel(
            album: album,
            photosUseCase: mockUseCase,
            navigationHandler: { _ in }
        )
        
        await viewModel.viewDidLoad()
        
        try await Task.sleep(nanoseconds: 1_000_000_000) // 1 second in nanoseconds
        
        XCTAssertTrue(viewModel.showError, "Expected showError to be true on fetch error")
    }
    
    func testPhotoFiltering() async throws {
        let album = AlbumEntity.mock
        let photos: [PhotoEntity] = [.mock]
        let mockUseCase = MockPhotosUseCase()
        mockUseCase.result = photos
        
        let viewModel = AlbumViewModel(album: album,
                                       photosUseCase: mockUseCase,
                                       navigationHandler: { _ in })
        
        await viewModel.viewDidLoad()
        
        try await Task.sleep(nanoseconds: 1_000_000_000) // 1 second in nanoseconds
        
        viewModel.filterPhotos("Photo")
        
        switch viewModel.viewState {
        case .content(let photoAdapters):
            XCTAssertEqual(photoAdapters.count, 1)
        default:
            XCTFail("Expected filtered content state")
        }
    }
    
    func testSelectPhotoNavigation() async throws {
        let album = AlbumEntity.mock
        let mockUseCase = MockPhotosUseCase()
        let mockNavigationHandler = MockNavigationHandler()
        mockUseCase.result = [PhotoEntity.mock]
        
        let viewModel = AlbumViewModel(
            album: album,
            photosUseCase: mockUseCase,
            navigationHandler: mockNavigationHandler.handle
        )
        
        await viewModel.viewDidLoad()
        
        try await Task.sleep(nanoseconds: 1_000_000_000) // 1 second in nanoseconds
        
        let photoAdapter = PhotoAdapter(photo: .mock)
        viewModel.selectPhoto(photoAdapter)
        
        if case let .openPhotos(url) = mockNavigationHandler.lastAction {
            XCTAssertEqual(url.absoluteString, PhotoEntity.mock.url)
        } else {
            XCTFail("Expected navigation action to open photo URL")
        }
    }
}
