//
//  AlbumViewModel.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import Domain
import Foundation

// MARK: - UsersListViewModel
@MainActor
final public class AlbumViewModel: ObservableObject {
    
    // MARK: Private Properties
    private let navigationHandler: NavigationActionHandler
    
    // MARK: Data
    private let album: AlbumEntity
    
    // MARK: UseCase
    private let photosUseCase: PhotosUseCaseProtocol
    
    // MARK: Publishers
    @Published var viewState: AlbumViewState = .loading
    @Published var showError = false
    
    // MARK: Initialization
    init(
        album: AlbumEntity,
        photosUseCase: PhotosUseCaseProtocol,
        navigationHandler: @escaping NavigationActionHandler
    ) {
        self.album = album
        self.photosUseCase = photosUseCase
        self.navigationHandler = navigationHandler
    }
}

extension AlbumViewModel {
    func viewDidLoad() {
        fetchViewData()
    }
}

// MARK: - Calling Api's
private extension AlbumViewModel {
    func fetchViewData() {
        Task {
            do {
                let photos = try await photosUseCase.getPhotos(albumId: album.id)
                self.viewState = .content(photos.map { PhotoAdapter(photo: $0) })
            } catch {
                self.showError = true
            }
        }
    }
}

// MARK: - Navigation
extension AlbumViewModel {
    public typealias NavigationActionHandler = (AlbumViewModel.NavigationAction) -> Void
    
    public enum NavigationAction {
        case openPhotos(PhotoAdapter)
    }
}
