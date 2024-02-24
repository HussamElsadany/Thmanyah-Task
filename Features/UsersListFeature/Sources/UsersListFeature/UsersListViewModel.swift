//
//  UsersListViewModel.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import Domain
import Foundation

// MARK: - UsersListViewModel
@MainActor
final public class UsersListViewModel: ObservableObject {
    
    // MARK: Private Properties
    private let navigationHandler: NavigationActionHandler
    
    // MARK: Data
    private var user: UserEntity?
    private var albums: [AlbumEntity] = []
    
    // MARK: UseCase
    private let usersUseCase: UsersUseCaseProtocol
    private let albumsUseCase: AlbumsUseCaseProtocol
    
    // MARK: Publishers
    @Published public var viewState: UsersListViewState = .loading
    @Published public var showError = false
    
    // MARK: Initialization
    public init(
        usersUseCase: UsersUseCaseProtocol,
        albumsUseCase: AlbumsUseCaseProtocol,
        navigationHandler: @escaping NavigationActionHandler
    ) {
        self.usersUseCase = usersUseCase
        self.albumsUseCase = albumsUseCase
        self.navigationHandler = navigationHandler
    }
}

extension UsersListViewModel {
    public func viewDidLoad() {
        fetchViewData()
    }
    
    public func selectAlbum(_ album: AlbumAdapter) {
        guard let selectedAlbum = self.albums.first(where: {
            $0.id == album.id
        }) else {
            return
        }
        navigationHandler(.openAlbum(albumId: selectedAlbum))
    }
}

// MARK: - Calling Api's
private extension UsersListViewModel {
    func fetchViewData() {
        Task {
            do {
                let users = try await usersUseCase.getUsers()
                guard let user = users.randomElement() else { return }
                self.user = user
                let albums = try await albumsUseCase.getAlbums(userId: user.id)
                self.albums = albums
                let userAdapter = UserAdapter(user: user, albums: albums)
                self.viewState = .content(userAdapter)
            } catch {
                self.showError = true
            }
        }
    }
}

// MARK: - Navigation
extension UsersListViewModel {
    public typealias NavigationActionHandler = (UsersListViewModel.NavigationAction) -> Void
    
    public enum NavigationAction {
        case openAlbum(albumId: AlbumEntity)
    }
}
