//
//  LoginViewController.swift
//  FacebookFriends
//
//  Created by Sinan Ulusoy on 31.03.2023.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    
    private let logoImageView = UIImageView()
    private let containerView = UIView()
    private let usernameTextField = UITextField()
    private let passwordTextField = UITextField()
    private let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        setup()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    private func setup() {

    }
    
    private func setupView() {
        logoImageView.backgroundColor = .orange
        containerView.backgroundColor = .blue
        usernameTextField.backgroundColor = .red
        passwordTextField.backgroundColor = .red
        loginButton.backgroundColor = .red
    }
    
    private func setupHierarchy() {
        view.addSubview(
            logoImageView,
            containerView
        )
        containerView.addSubview(
            usernameTextField,
            passwordTextField,
            loginButton
        )
    }
    
    private func setupLayout() {
        containerView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.25)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(containerView).multipliedBy(0.2)
            make.width.equalTo(containerView)
            make.bottom.equalTo(containerView.snp.top).offset(-16)
        }
        
        usernameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalToSuperview().multipliedBy(0.15)
            make.top.equalToSuperview().offset(32)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.width.height.equalTo(usernameTextField)
            make.top.equalTo(usernameTextField.snp.bottom).offset(16)
        }
        
        loginButton.snp.makeConstraints { make in
            make.centerX.height.equalTo(usernameTextField)
            make.width.equalTo(usernameTextField).multipliedBy(0.5)
            make.bottom.equalToSuperview().offset(-32)
        }
    }
}
