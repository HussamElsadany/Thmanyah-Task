//
//  AlbumViewBuilder.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import SwiftUI
import Domain

public struct AlbumViewBuilder {

    private init() { }
    
    @MainActor
    public static func build(
        album: AlbumEntity,
        photosUseCase: PhotosUseCaseProtocol,
        navigationHandler: @escaping AlbumViewModel.NavigationActionHandler
    ) -> UIViewController {
        let viewModel = AlbumViewModel(
            album: album,
            photosUseCase: photosUseCase,
            navigationHandler: navigationHandler
        )
        
        let view = AlbumView(viewModel: .init(wrappedValue: viewModel))
        return UIHostingController(rootView: view)
    }
}
