//
//  ZoomableImageViewModel.swift
//  
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import SwiftUI
import Foundation
import ImageCache
import Extensions

// MARK: - ZoomableImageViewModel
@MainActor
final public class ZoomableImageViewModel: ObservableObject {
    
    // MARK: Data
    private let imageUrl: URL
    var image: UIImage?
    
    // MARK: Publishers
    @Published var viewState: ViewState<Image> = .loading
    @Published var showShareSheet: Bool = false
    
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
            image = newImage
            viewState = .content(Image(uiImage: newImage))
        }
    }
    
    func sharePhotoURL() {
        showShareSheet = true
    }
}
