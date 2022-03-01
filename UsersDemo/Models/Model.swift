//
//  Model.swift
//  UsersDemo
//
//  Created by Alejandro Perea Navarrete on 28/2/22.
//

import Foundation

struct Result: Codable {
    var results: [User]
}

struct User: Codable {
    let gender: Gender
    let name: Name
    let email: String
    let phone: String
    let login: Login
    let picture: Picture
}

extension User: Hashable {
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.login.uuid == rhs.login.uuid
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(login.uuid)
    }
}

struct Login: Codable {
    let uuid: String
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}

struct Name: Codable {
    let first, last: String
}

struct Picture: Codable {
    let large, medium, thumbnail: String
}

