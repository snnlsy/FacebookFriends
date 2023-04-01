//
//  FriendsModel.swift
//  FacebookFriends
//
//  Created by Sinan Ulusoy on 1.04.2023.
//

import Foundation

struct FriendsModel: Codable {
    let results: [ResultModel]?
    let info: InfoModel?
}

struct InfoModel: Codable {
    let seed: String?
    let results, page: Int?
    let version: String?
}

struct ResultModel: Codable {
    let gender: String?
    let name: NameModel?
    let location: LocationModel?
    let email: String?
    let login: LoginModel?
    let dob, registered: DobModel?
    let phone, cell: String?
    let id: IDModel?
    let picture: PictureModel?
    let nat: String?
}

struct DobModel: Codable {
    let date: String?
    let age: Int?
}

struct IDModel: Codable {
    let name, value: String?
}

struct LocationModel: Codable {
    let street: StreetModel?
    let city, state, country: String?
    let coordinates: CoordinatesModel?
    let timezone: TimezoneModel?
}

struct CoordinatesModel: Codable {
    let latitude, longitude: String?
}

struct StreetModel: Codable {
    let number: Int?
    let name: String?
}

struct TimezoneModel: Codable {
    let offset, description: String?
}

struct LoginModel: Codable {
    let uuid, username, password, salt: String?
    let md5, sha1, sha256: String?
}

struct NameModel: Codable {
    let title, first, last: String?
}

struct PictureModel: Codable {
    let large, medium, thumbnail: String?
}
