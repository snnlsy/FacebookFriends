//
//  LoginViewModel.swift
//  FacebookFriends
//
//  Created by Sinan Ulusoy on 1.04.2023.
//

import Foundation

protocol LoginViewModelProtocol: AnyObject {
    func pushFriendsVC(_ username: String)
    func showToastMessage()
}

final class LoginViewModel {
    
    weak var delegate: LoginViewModelProtocol?
    
    private let mockUsernameList = [
        CredentialModel(username: "User1", password: "pass1"),
        CredentialModel(username: "User2", password: "pass2"),
        CredentialModel(username: "User3", password: "pass3"),
        CredentialModel(username: "User4", password: "pass4"),
        CredentialModel(username: "User5", password: "pass5"),
    ]
    
    func checkCredential(loginModel: CredentialModel) {
        let isCorrect = mockUsernameList.contains(where: { $0 == loginModel })
        switch isCorrect {
        case true:
            guard let username = loginModel.username else { return }
            delegate?.pushFriendsVC(username)
        case false:
            delegate?.showToastMessage()
        }
    }
}
