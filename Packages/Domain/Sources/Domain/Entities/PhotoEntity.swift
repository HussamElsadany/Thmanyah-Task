//
//  PhotoEntity.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

public struct PhotoEntity: Codable, Equatable {
    public let albumID, id: Int
    public let title: String
    public let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}

extension PhotoEntity {
    public static var mock: Self {
        .init(
            albumID: 1,
            id: 1,
            title: "",
            url: "",
            thumbnailURL: ""
        )
    }
}
