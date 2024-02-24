//
//  AlbumEntity.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

public struct AlbumEntity: Codable, Equatable {
    public let userID, id: Int
    public let title: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title
    }
}

extension AlbumEntity {
    public static var mock: Self {
        .init(userID: 1, id: 1, title: "Title")
    }
}
