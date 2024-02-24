//
//  PhotoAdapter.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import Domain
import ImageCache

public struct PhotoAdapter: Identifiable {
        
    public let id: Int
    public let title: String
    public let thumbnail: RemoteImageResource
    public let image: RemoteImageResource
    
    public init(photo: PhotoEntity) {
        self.id = photo.id
        self.title = photo.title
        self.thumbnail = RemoteImageResource(path: photo.thumbnailURL, placeholder: nil)
        self.image = RemoteImageResource(path: photo.url, placeholder: nil)
    }
}
