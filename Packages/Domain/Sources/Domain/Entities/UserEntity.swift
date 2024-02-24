//
//  UserEntity.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

public struct UserEntity: Codable, Hashable {
    public let id: Int
    public let name, username, email: String
    public let address: AddressEntity
    public let phone, website: String
    public let company: CompanyEntity
}

extension UserEntity {
    public struct AddressEntity: Codable, Hashable {
        public let street, suite, city, zipcode: String
        public let geo: GeoEntity
    }
    
    public struct GeoEntity: Codable, Hashable {
        public let lat, lng: String
    }

    public struct CompanyEntity: Codable, Hashable {
        public let name, catchPhrase, bs: String
    }
}
