//
//  AlbumsEntity.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

public struct AlbumsEntity: Codable {
    public let userID, id: Int
    public let title: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title
    }
}
