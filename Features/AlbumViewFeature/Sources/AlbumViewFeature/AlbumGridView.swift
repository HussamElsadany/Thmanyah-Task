//
//  AlbumGridView.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import SwiftUI
import ImageCache

struct AlbumGridView: View {
    
    var columns: [GridItem] {
        Array(repeating: .init(.flexible(), spacing: Sizes.spacing0), count: 3)
    }
    
    let photos: [PhotoAdapter]
    let selectionHandler: (PhotoAdapter) -> Void
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVGrid(columns: columns, spacing: Sizes.spacing0) {
                    ForEach(photos) { item in
                        RemoteImageView(resource: item.thumbnail)
                            .frame(height: Sizes.calculateHeight(geometry.size.width))
                            .frame(maxWidth: .infinity)
                            .onTapGesture {
                                selectionHandler(item)
                            }
                    }
                }
                .padding(Sizes.spacing0)
            }
        }
    }
}

private extension AlbumGridView {
    struct Sizes {
        static let spacing0: CGFloat = 0
        
        static func calculateHeight(_ width: CGFloat) -> CGFloat {
            return width / 3
        }
    }
}
