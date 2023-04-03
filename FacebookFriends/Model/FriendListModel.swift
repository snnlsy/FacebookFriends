//
//  FriendListModel.swift
//  FacebookFriends
//
//  Created by Sinan Ulusoy on 3.04.2023.
//

import Foundation
import RealmSwift

final class FriendListModel: Object {
    @objc dynamic var id: String = ""
    let friendList = List<String>()
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
