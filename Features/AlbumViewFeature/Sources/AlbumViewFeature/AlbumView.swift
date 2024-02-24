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
    
    @State
    private var searchText = ""
    
    // MARK: - Initialization
    init(viewModel: StateObject<AlbumViewModel>) {
        self._viewModel = viewModel
    }
    
    // MARK: - Body
    var body: some View {
        contentView
            .navigationTitle(viewModel.albumTitle)
            .onLoad {
                viewModel.viewDidLoad()
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .onChange(of: searchText, { _, newValue in
                viewModel.filterPhotos(newValue)
            })
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
            AlbumGridView(photos: photos)
        }
    }
}
