//
//  UsersListView.swift
//  
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import SwiftUI
import Extensions

struct UsersListView: View {
    
    // MARK: - Private Properties
    @StateObject 
    private var viewModel: UsersListViewModel
    
    // MARK: - Initialization
    init(viewModel: StateObject<UsersListViewModel>) {
        self._viewModel = viewModel
    }
    
    // MARK: - Body
    var body: some View {
        contentView
            .navigationTitle("Profile")
            .onLoad {
                viewModel.viewDidLoad()
            }
            .padding(Sizes.contentInsets)
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
        case .content(let user):
            UserListContentView(
                user: user
            ) { selectedAlbum in
                viewModel.selectAlbum(selectedAlbum)
            }
        }
    }
}

private extension UsersListView {
    struct Sizes {
        static let contentInsets = EdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 24)
    }
}
