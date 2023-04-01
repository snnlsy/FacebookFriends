//
//  LoginModel.swift
//  FacebookFriends
//
//  Created by Sinan Ulusoy on 1.04.2023.
//

import Foundation

struct CredentialModel: Equatable {
    let username: String?
    let password: String?
    
    init(username: String?, password: String?) {
        self.username = username
        self.password = password
    }
    
    static func ==(lhs: CredentialModel, rhs: CredentialModel) -> Bool {
        return lhs.username == rhs.username && lhs.password == rhs.password
    }
}
