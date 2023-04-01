//
//  FriendsCollectionViewCell.swift
//  FacebookFriends
//
//  Created by Sinan Ulusoy on 31.03.2023.
//

import UIKit
import SnapKit

final class FriendsCollectionViewCell: UICollectionViewCell {

    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    private let locationLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    private func setup() {
        
    }
    
    private func setupView() {
        backgroundColor = K.Color.bg2
        layer.cornerRadius = K.Ui.cornerRadius1
        layer.masksToBounds = true
        
        
        profileImageView.image = UIImage(named: "logo")

        nameLabel.backgroundColor = K.Color.bg1
        nameLabel.layer.cornerRadius = K.Ui.cornerRadius2
        nameLabel.layer.masksToBounds = true
        nameLabel.text = "  name label"
        nameLabel.textColor = K.Color.text
        nameLabel.font = nameLabel.font.withSize(K.Ui.font)
        
        emailLabel.backgroundColor = K.Color.bg1
        emailLabel.layer.cornerRadius = K.Ui.cornerRadius2
        emailLabel.layer.masksToBounds = true
        emailLabel.text = "  email label"
        emailLabel.textColor = K.Color.text
        emailLabel.font = nameLabel.font.withSize(K.Ui.font)

        locationLabel.backgroundColor = K.Color.bg1
        locationLabel.layer.cornerRadius = K.Ui.cornerRadius2
        locationLabel.layer.masksToBounds = true
        locationLabel.text = "  location label"
        locationLabel.textColor = K.Color.text
        locationLabel.font = nameLabel.font.withSize(K.Ui.font)
//        locationLabel.edgein

        
        
    }
    
    private func setupHierarchy() {
        contentView.addSubview(
            profileImageView,
            nameLabel,
            emailLabel,
            locationLabel
        )
    }
    
    private func setupLayout() {
        profileImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.width.equalTo(50)
            make.top.equalToSuperview().offset(16)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
            make.height.equalTo(25)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.leading.trailing.height.equalTo(nameLabel)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(8)
            make.leading.trailing.height.equalTo(nameLabel)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}