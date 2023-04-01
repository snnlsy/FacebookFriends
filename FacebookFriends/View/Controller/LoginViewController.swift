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
    
    private let loginVM = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    private func setup() {
        loginVM.delegate = self
    }
    
    private func setupView() {
        view.backgroundColor = K.Color.bg1

        logoImageView.image = UIImage(named: "logo2")
        
        containerView.layer.cornerRadius = K.Ui.cornerRadius1
        containerView.layer.masksToBounds = true
        containerView.backgroundColor = K.Color.bg2
    
        usernameTextField.layer.cornerRadius = K.Ui.cornerRadius1
        usernameTextField.layer.masksToBounds = true
        usernameTextField.backgroundColor = K.Color.bg1
        usernameTextField.textColor = K.Color.text
        usernameTextField.placeholder = K.LoginVC.usernamePlaceholder
        usernameTextField.leftViewMode = .always
        usernameTextField.leftView = UIView(frame: CGRect(
            x: 0, y: 0,
            width: 16,
            height: usernameTextField.frame.height))

        passwordTextField.layer.cornerRadius = K.Ui.cornerRadius1
        passwordTextField.layer.masksToBounds = true
        passwordTextField.backgroundColor = K.Color.bg1
        passwordTextField.textColor = .systemGray
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = K.LoginVC.passwordPlaceholder
        passwordTextField.leftViewMode = .always
        passwordTextField.leftView = UIView(frame: CGRect(
            x: 0, y: 0,
            width: 16,
            height: passwordTextField.frame.height))
        
        loginButton.layer.cornerRadius = K.Ui.cornerRadius1
        loginButton.layer.masksToBounds = true
        loginButton.backgroundColor = K.Color.bg1
        loginButton.setTitle(K.LoginVC.loginButtonTitle, for: .normal)
        loginButton.setTitleColor(.systemGray, for: .normal)
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
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
            make.leading.trailing.equalTo(containerView)
            make.height.equalToSuperview().multipliedBy(0.1)
            make.bottom.equalTo(containerView.snp.top).offset(-64)
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


extension LoginViewController {
    
    @objc private func didTapLoginButton() {
        let username = usernameTextField.text
        let password = passwordTextField.text
        let loginModel = LoginModel(username: username, password: password)
        loginVM.checkCredential(loginModel: loginModel)
    }
}

extension LoginViewController: LoginViewModelProtocol {
    
    func pushFriendsVC() {
        let vc = FriendsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func showToastMessage() {
        Toast.show(message: K.LoginVC.wrongCredentialMessage, vc: self)
    }
}
