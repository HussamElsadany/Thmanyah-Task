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
    
    // MARK: UseCase
    private let usersUseCase: UsersUseCaseProtocol
    private let albumsUseCase: AlbumsUseCaseProtocol
    
    // MARK: Publishers
    @Published var viewState: UsersListViewState = .loading
    
    // MARK: Initialization
    init(
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
    func viewDidLoad() {
        fetchViewData()
    }
    
    func selectAlbum(_ album: AlbumAdapter) {
        
    }
}

// MARK: - Calling Api's
private extension UsersListViewModel{
    func fetchViewData() {
        Task {
            do {
                let users = try await usersUseCase.getUsers()
                guard let user = users.randomElement() else { return }
                let albums = try await albumsUseCase.getAlbums(userId: user.id)
                let userAdapter = UserAdapter(user: user, albums: albums)
                self.viewState = .content(userAdapter)
            } catch {
                // Handle error
            }
        }
    }
}

// MARK: - Navigation
extension UsersListViewModel {
    public typealias NavigationActionHandler = (UsersListViewModel.NavigationAction) -> Void
    
    public enum NavigationAction {
        case openPhotos(albumId: Int)
    }
}
