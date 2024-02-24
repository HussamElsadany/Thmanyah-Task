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
    
    var body: some View {
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

private extension AlbumGridView {
    struct Sizes {
        static let spacing0: CGFloat = 0
        
        static func calculateHeight(_ width: CGFloat) -> CGFloat {
            return width / 3
        }
    }
}
