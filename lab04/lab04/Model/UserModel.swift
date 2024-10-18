//
//  RandomUser.swift
//  lab04
//
//  Created by Alex Huaracha on 16/10/24.
//

import Foundation
import Combine

// Modelos
struct User: Codable, Equatable {
    let name: Name
    let email: String
    let phone: String
    let picture: Picture
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.email == rhs.email
    }
}

struct Name: Codable {
    let title: String
    let first: String
    let last: String
}

struct Picture: Codable {
    let large: String
    let medium: String
    let thumbnail: String
}

struct UserResponse: Codable {
    let results: [User]
    let info: Info
}

struct Info: Codable {
    let seed: String
    let results: Int
    let page: Int
    let version: String
}
