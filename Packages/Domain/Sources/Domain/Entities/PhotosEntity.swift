//
//  PhotosEntity.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

public struct PhotosEntity: Codable {
    public let albumID, id: Int
    public let title: String
    public let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}
