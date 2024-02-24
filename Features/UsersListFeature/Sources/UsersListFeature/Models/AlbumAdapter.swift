//
//  AlbumAdapter.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import Domain

public struct AlbumAdapter: Identifiable {
        
    public let id: Int
    public let title: String
    
    public init(album: AlbumEntity) {
        self.id = album.id
        self.title = album.title
    }
}
