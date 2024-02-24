//
//  UserAlbumRowView.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import SwiftUI

struct UserAlbumRowView: View {
    
    let album: AlbumAdapter
    let selectionHandler: (AlbumAdapter) -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Divider()
            
            Text(album.title)
                .font(.callout)
                .padding(.vertical, Sizes.textVerticalPadding)
        }
        .onTapGesture {
            selectionHandler(album)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private extension UserAlbumRowView {
    struct Sizes {
        static let textVerticalPadding: CGFloat = 8
    }
}
