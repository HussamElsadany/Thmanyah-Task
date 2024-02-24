//
//  File.swift
//  
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import XCTest
import Domain
import UsersListFeature

@MainActor
final class UsersListViewModelTests: XCTestCase {
    
    func testSuccessfulDataFetching() async throws {
        let mockUsersUseCase = MockUsersUseCase()
        let mockAlbumsUseCase = MockAlbumsUseCase()
        let mockNavigationHandler = MockNavigationHandler()
        let viewModel = UsersListViewModel(
            usersUseCase: mockUsersUseCase,
            albumsUseCase: mockAlbumsUseCase,
            navigationHandler: mockNavigationHandler.handle
        )
        
        mockUsersUseCase.result = [UserEntity.mock]
        mockAlbumsUseCase.result = [AlbumEntity.mock]
        
        await viewModel.viewDidLoad()
        
        try await Task.sleep(nanoseconds: 1_000_000_000) // 1 second in nanoseconds

        switch viewModel.viewState {
        case .content(let userAdapter):
            XCTAssertEqual(userAdapter.id, 1)
            XCTAssertEqual(userAdapter.albums.count, 1)
        default:
            XCTFail("Expected view state to be `.content`, got \(viewModel.viewState)")
        }
    }
    
    func testErrorHandling() async throws {
        let mockUsersUseCase = MockUsersUseCase()
        let mockAlbumsUseCase = MockAlbumsUseCase()
        let viewModel = UsersListViewModel(usersUseCase: mockUsersUseCase, albumsUseCase: mockAlbumsUseCase, navigationHandler: { _ in })
        
        mockUsersUseCase.error = NSError(domain: "TestError", code: -1, userInfo: nil)
        
        await viewModel.viewDidLoad()
        
        try await Task.sleep(nanoseconds: 1_000_000_000) // 1 second in nanoseconds
        
        // Check if showError is true upon error
        XCTAssertTrue(viewModel.showError, "Expected showError to be true on error")
    }
    
    func testSelectAlbumNavigation() async throws {
        let mockUsersUseCase = MockUsersUseCase()
        let mockAlbumsUseCase = MockAlbumsUseCase()
        let mockNavigationHandler = MockNavigationHandler()
        let viewModel = UsersListViewModel(
            usersUseCase: mockUsersUseCase,
            albumsUseCase: mockAlbumsUseCase,
            navigationHandler: mockNavigationHandler.handle
        )
        
        mockUsersUseCase.result = [UserEntity.mock]
        mockAlbumsUseCase.result = [AlbumEntity.mock]
        
        await viewModel.viewDidLoad()
        
        try await Task.sleep(nanoseconds: 1_000_000_000) // 1 second in nanoseconds
        
        let testAlbumAdapter = AlbumAdapter(album: .mock)
        viewModel.selectAlbum(testAlbumAdapter)
        
        // Check if the correct navigation action is triggered
        if case let .openAlbum(albumId) = mockNavigationHandler.lastAction {
            XCTAssertEqual(albumId.id, AlbumEntity.mock.id)
        } else {
            XCTFail("Expected navigation action to be `.openAlbum`, got \(String(describing: mockNavigationHandler.lastAction))")
        }
    }
}
