//
//  LoginViewModel.swift
//  FacebookFriends
//
//  Created by Sinan Ulusoy on 1.04.2023.
//

import Foundation

protocol LoginViewModelProtocol: AnyObject {
    func pushFriendsVC()
    func showToastMessage()
}

final class LoginViewModel {
    
    weak var delegate: LoginViewModelProtocol?
    
    private let mockUsernameList = [
        LoginModel(username: "User1", password: "pass1"),
        LoginModel(username: "User2", password: "pass2"),
        LoginModel(username: "User3", password: "pass3"),
        LoginModel(username: "User4", password: "pass4"),
        LoginModel(username: "User5", password: "pass5"),
    ]
    
    func checkCredential(loginModel: LoginModel) {
        let isCorrect = mockUsernameList.contains(where: { $0 == loginModel })
        switch isCorrect {
        case true:
            delegate?.pushFriendsVC()
        case false:
            delegate?.showToastMessage()
        }
    }
}
