//
//  ZoomableImageView.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import SwiftUI
import Extensions

struct AlbumView: View {
    
    // MARK: - Private Properties
    @StateObject
    private var viewModel: ZoomableImageViewModel
    
    @State
    private var scale: CGFloat = 1.0
    
    // MARK: - Initialization
    init(viewModel: StateObject<ZoomableImageViewModel>) {
        self._viewModel = viewModel
    }
    
    // MARK: - Body
    var body: some View {
        contentView
            .navigationTitle("Hussam")
            .onLoad {
                viewModel.loadImage()
            }
    }
    
    @ViewBuilder
    private var contentView: some View {
        switch viewModel.viewState {
        case .loading:
            LoadingView()
        case .content(let image):
            ImageView(image: image)
        }
    }
}

struct ImageView: View {
    
    var image: Image
    
    @State private var scale: CGFloat = 1.0
    @GestureState private var zoomScale: CGFloat = 1.0
    
    private func fitScale(for size: CGSize, in geometrySize: CGSize) -> CGFloat {
        let widthRatio = geometrySize.width / size.width
        let heightRatio = geometrySize.height / size.height
        return min(widthRatio, heightRatio)
    }
    
    var body: some View {
        GeometryReader { geometry in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(scale * zoomScale)
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                .gesture(
                    MagnificationGesture()
                        .updating($zoomScale) { currentState, gestureState, _ in
                            gestureState = currentState
                        }
                        .onEnded { finalScale in
                            self.scale = max(self.scale * finalScale, 1.0)
                        }
                )
        }
    }
}
