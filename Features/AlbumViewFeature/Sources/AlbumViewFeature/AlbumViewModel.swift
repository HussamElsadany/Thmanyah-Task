//
//  AlbumViewModel.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import Domain
import Foundation
import Extensions

// MARK: - AlbumViewModel
@MainActor
final public class AlbumViewModel: ObservableObject {
    
    // MARK: Private Properties
    private let navigationHandler: NavigationActionHandler
    
    // MARK: Data
    private let album: AlbumEntity
    private var photos: [PhotoEntity] = []
    
    // MARK: UseCase
    private let photosUseCase: PhotosUseCaseProtocol
    
    // MARK: Publishers
    @Published public var viewState: ViewState<[PhotoAdapter]> = .loading
    @Published public var showError = false
    @Published var albumTitle: String
    
    // MARK: Initialization
    public init(
        album: AlbumEntity,
        photosUseCase: PhotosUseCaseProtocol,
        navigationHandler: @escaping NavigationActionHandler
    ) {
        self.album = album
        self.photosUseCase = photosUseCase
        self.navigationHandler = navigationHandler
        self.albumTitle = album.title
    }
}

extension AlbumViewModel {
    public func viewDidLoad() {
        fetchViewData()
    }
    
    public func filterPhotos(_ searchText: String) {
        if searchText.isEmpty {
            self.viewState = .content(self.photos.map { PhotoAdapter(photo: $0)})
        } else {
            let photos = self.photos.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
            self.viewState = .content(photos.map { PhotoAdapter(photo: $0)})
        }
    }
    
    public func selectPhoto(_ photo: PhotoAdapter) {
        guard let photo = self.photos.first(where: {$0.id == photo.id}),
              let url = URL(string: photo.url) else {
            return
        }
        navigationHandler(.openPhotos(url))
    }
}

// MARK: - Calling Api's
private extension AlbumViewModel {
    func fetchViewData() {
        Task {
            do {
                let photos = try await photosUseCase.getPhotos(albumId: album.id)
                self.photos = photos
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
        case openPhotos(URL)
    }
}
