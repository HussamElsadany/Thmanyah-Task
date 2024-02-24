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
            albumsUseCase: albumsUseCase) { [weak self] destination in
                guard let self else { return }
                switch destination {
                case .openPhotos(let albumId): break
                }
            }
        
        self.rootController.viewControllers = [view]
        self.window?.rootViewController = rootController
        window?.makeKeyAndVisible()
    }
}
