//
//  UserModel.swift
//  FacebookFriends
//
//  Created by Sinan Ulusoy on 1.04.2023.
//

import Foundation
import RealmSwift

final class UserModel: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var age: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var country: String = ""
    @objc dynamic var city: String = ""
    @objc dynamic var latitude: Double = 0
    @objc dynamic var longitude: Double = 0
    @objc dynamic var thumbnailImage: String = ""
    @objc dynamic var largeImage: String = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
