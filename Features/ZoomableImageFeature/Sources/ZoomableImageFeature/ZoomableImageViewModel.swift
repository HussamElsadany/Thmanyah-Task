//
//  ZoomableImageViewModel.swift
//  
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import SwiftUI
import Foundation
import ImageCache

// MARK: - ZoomableImageViewModel
@MainActor
final public class ZoomableImageViewModel: ObservableObject {
    
    // MARK: Data
    private let imageUrl: URL
   
    // MARK: Publishers
    @Published var viewState: ZoomableImageViewState = .loading
    
    // MARK: Initialization
    init(imageUrl: URL) {
        self.imageUrl = imageUrl
    }
}

extension ZoomableImageViewModel {
    func loadImage() {
        ImageCache.shared.load(
            url: imageUrl as NSURL
        ) { [weak self] url, newImage in
            guard let self, let newImage else { return }
            viewState = .content(Image(uiImage: newImage))
        }
    }
}
