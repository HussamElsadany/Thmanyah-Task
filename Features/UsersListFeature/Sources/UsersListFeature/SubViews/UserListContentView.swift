//
//  UserListContentView.swift
//  
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import SwiftUI

struct UserListContentView: View {
    
    let user: UserAdapter
    let selectionHandler: (AlbumAdapter) -> Void
    
    var body: some View {
        VStack {
            UserHeaderView(user: user)
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    ForEach(user.albums) {
                        UserAlbumRowView(album: $0, selectionHandler: selectionHandler)
                    }
                }
            }
        }
    }
}
