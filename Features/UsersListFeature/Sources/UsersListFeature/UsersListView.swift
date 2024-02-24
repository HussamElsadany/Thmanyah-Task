//
//  UsersListView.swift
//  
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import SwiftUI

struct UsersListView: View {
    
    // MARK: - Private Properties
    @StateObject private var viewModel: UsersListViewModel
    
    // MARK: - Initialization
    init(viewModel: StateObject<UsersListViewModel>) {
        self._viewModel = viewModel
    }
    
    var body: some View {
        Text("Hussam")
    }
}
