//
//  AlbumView.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import SwiftUI
import Extensions
import ImageCache

struct AlbumView: View {
    
    // MARK: - Private Properties
    @StateObject
    private var viewModel: AlbumViewModel
    
    // MARK: - Initialization
    init(viewModel: StateObject<AlbumViewModel>) {
        self._viewModel = viewModel
    }
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: Sizes.spacing0),
        GridItem(.flexible(), spacing: Sizes.spacing0),
        GridItem(.flexible(), spacing: Sizes.spacing0)
    ]
    
    
    // MARK: - Body
    var body: some View {
        contentView
            .navigationTitle("Profile")
            .onLoad {
                viewModel.viewDidLoad()
            }
            .alert(isPresented: $viewModel.showError, content: {
                Alert(
                    title: Text("Error"),
                    message: Text("Something Wrong Happen!")
                )
            })
    }
    
    @ViewBuilder
    private var contentView: some View {
        switch viewModel.viewState {
        case .loading:
            LoadingView()
        case .content(let photos):
            GeometryReader { geometry in
                ScrollView {
                    LazyVGrid(columns: columns, spacing: Sizes.spacing0) {
                        ForEach(photos) {
                            RemoteImageView(resource: $0.thumbnail)
                                .frame(height: Sizes.calculateHeight(geometry.size.width))
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .padding(Sizes.spacing0)
                }
            }
        }
    }
}

private extension AlbumView {
    struct Sizes {
        static let spacing0: CGFloat = 0
        
        static func calculateHeight(_ width: CGFloat) -> CGFloat {
            return width / 3
        }
    }
}
