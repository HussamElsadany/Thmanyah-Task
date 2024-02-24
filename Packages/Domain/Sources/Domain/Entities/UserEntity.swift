//
//  UserEntity.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

public struct UserEntity: Codable, Equatable {
    public let id: Int
    public let name, username, email: String
    public let address: AddressEntity
    public let phone, website: String
}

public struct AddressEntity: Codable, Equatable {
    public let street, suite, city, zipcode: String
}

extension UserEntity {
    public static var mock: Self {
        .init(
            id: 1,
            name: "Name",
            username: "User Name",
            email: "",
            address: .mock,
            phone: "0101010",
            website: ""
        )
    }
}

extension AddressEntity {
    public static var mock: Self {
        .init(
            street: "Street",
            suite: "",
            city: "",
            zipcode: ""
        )
    }
}
