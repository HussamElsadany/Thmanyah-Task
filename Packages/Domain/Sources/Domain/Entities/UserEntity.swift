//
//  UserEntity.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

public struct UserEntity: Codable {
    public let id: Int
    public let name, username, email: String
    public let address: AddressEntity
    public let phone, website: String
    public let company: CompanyEntity
}

extension UserEntity {
    public struct AddressEntity: Codable {
        public let street, suite, city, zipcode: String
        public let geo: GeoEntity
    }
    
    public struct GeoEntity: Codable {
        public let lat, lng: String
    }

    public struct CompanyEntity: Codable {
        public let name, catchPhrase, bs: String
    }
}
