//
//  Constant.swift
//  FacebookFriends
//
//  Created by Sinan Ulusoy on 1.04.2023.
//

import UIKit

struct K {
    
    struct Ui {
        static let cornerRadius1 = 16.0
        static let cornerRadius2 = 8.0
        static let font = 12.0
        static let labelPadding = "  "
    }
    
    struct Color {
        static let bg1 = UIColor.systemGray5
        static let bg2 = UIColor.systemGray3
        static let text = UIColor.systemGray
    }
    
    struct Image {
        static let logo = "logo2"
        static let exit = "pip.exit"
    }
    
    struct LoginVC {
        static let usernamePlaceholder = "Username"
        static let passwordPlaceholder = "Password"
        static let loginButtonTitle = "Login"
        static let wrongCredentialMessage = "Wrong username or password"
    }
    
    struct FriendsVC {
        static let title = "Friends List"
    }
    
    struct DetailVC {
        static let nameLabel = "Name"
        static let emailLabel = "Email"
        static let locationLabel = "Location"
        static let phoneLabel = "Phone"
        static let ageLabel = "Age"

    }
    
    struct Api {
        static let url = "https://randomuser.me/api"
        static let results = 20
        static let resultsName = "results"
        static let pageName = "page"
        static let seedName = "seed"
    }
}
