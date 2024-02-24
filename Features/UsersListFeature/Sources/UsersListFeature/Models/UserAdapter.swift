//
//  UserAdapter.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import Domain

public struct UserAdapter: Identifiable {
    
    public typealias ID = Int
    
    public let id: ID
    public let name: String
    public let address: String
    public let albums: [AlbumAdapter]
}

// MARK: - Initialization from entities
extension UserAdapter {
    
    public init(user: UserEntity, albums: [AlbumEntity]) {
        self.id = user.id
        self.name = user.name
        self.address = [
            user.address.street,
            user.address.suite,
            user.address.city,
            user.address.zipcode
        ].joined(separator: ", ")
        self.albums = albums.map { AlbumAdapter(album: $0) }
    }
}
