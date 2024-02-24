//
//  AppCoordinator.swift
//  Thmanyah-Task
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import UIKit
import Data
import Domain
import CoreNetwork
import AppEnvironment
import UsersListFeature
import AlbumViewFeature
import ZoomableImageFeature

/// Main application coordinator.
final class AppCoordinator {
    
    // MARK: Properties
    private weak var window: UIWindow?
    private let environment: AppEnvironmentProtocol
    private let rootController: UINavigationController
    
    // MARK: Initializationz
    init(
        window: UIWindow?,
        environment: AppEnvironmentProtocol = AppEnvironment.current,
        rootController: UINavigationController = UINavigationController()
    ) {
        self.window = window
        self.environment = environment
        self.rootController = rootController
    }
    
    // MARK: Start The Coordinator.
    @MainActor
    func start() {
        // TODO: Use DIContainer for network, useCases and repos.
        let network = NetworkClient()
        let usersRepository = UsersRepository(netWork: network)
        let usersUseCase = UsersUseCase(repository: usersRepository)
        
        let albumsRepository = AlbumsRepository(netWork: network)
        let albumsUseCase = AlbumsUseCase(repository: albumsRepository)
        
        let view = UsersListBuilder.build(
            usersUseCase: usersUseCase,
            albumsUseCase: albumsUseCase
        ) { [weak self] destination in
            guard let self else { return }
            switch destination {
            case .openAlbum(let album):
                openAlbumDetails(album)
            }
        }
        
        self.rootController.viewControllers = [view]
        self.window?.rootViewController = rootController
        window?.makeKeyAndVisible()
    }
}

private extension AppCoordinator {
    @MainActor
    func openAlbumDetails(_ album: AlbumEntity) {
        let network = NetworkClient()
        let photosRepository = PhotosRepository(netWork: network)
        let photosUseCase = PhotosUseCase(repository: photosRepository)
        
        let view = AlbumViewBuilder.build(
            album: album,
            photosUseCase: photosUseCase
        ) { [weak self] destination in
            guard let self else { return }
            switch destination {
            case .openPhotos(let url):
                openZoomableImage(imageURL: url)
            }
        }
        self.rootController.pushViewController(view, animated: true)
    }
}

private extension AppCoordinator {
    @MainActor 
    func openZoomableImage(imageURL: URL) {
        let view = ZoomableImageBuilder.build(imageURL: imageURL)
        self.rootController.pushViewController(view, animated: true)
    }
}
