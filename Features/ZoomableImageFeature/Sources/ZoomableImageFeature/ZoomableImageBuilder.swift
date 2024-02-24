//
//  ZoomableImageBuilder.swift
//  
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import SwiftUI

public struct ZoomableImageBuilder {

    private init() { }
    
    @MainActor
    public static func build(imageURL: URL) -> UIViewController {
        let viewModel = ZoomableImageViewModel(imageUrl: imageURL)
        let view = AlbumView(viewModel: .init(wrappedValue: viewModel))
        return UIHostingController(rootView: view)
    }
}
