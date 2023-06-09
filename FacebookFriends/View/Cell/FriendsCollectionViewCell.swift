//
//  FriendsCollectionViewCell.swift
//  FacebookFriends
//
//  Created by Sinan Ulusoy on 31.03.2023.
//

import UIKit
import SnapKit
import SDWebImage

final class FriendsCollectionViewCell: UICollectionViewCell {

    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    private let locationLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    private func setupView() {
        backgroundColor = K.Color.bg2
        layer.cornerRadius = K.Ui.cornerRadius1
        layer.masksToBounds = true
        
        profileImageView.layer.cornerRadius = K.Ui.cornerRadius2
        profileImageView.layer.masksToBounds = true
        profileImageView.backgroundColor = K.Color.bg1
        
        nameLabel.backgroundColor = K.Color.bg1
        nameLabel.layer.cornerRadius = K.Ui.cornerRadius2
        nameLabel.layer.masksToBounds = true
        nameLabel.textColor = K.Color.text
        nameLabel.font = nameLabel.font.withSize(K.Ui.font)
        
        locationLabel.backgroundColor = K.Color.bg1
        locationLabel.layer.cornerRadius = K.Ui.cornerRadius2
        locationLabel.layer.masksToBounds = true
        locationLabel.textColor = K.Color.text
        locationLabel.font = nameLabel.font.withSize(K.Ui.font)
    }
    
    private func setupHierarchy() {
        contentView.addSubview(
            profileImageView,
            nameLabel,
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
        
        locationLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.leading.trailing.height.equalTo(nameLabel)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension FriendsCollectionViewCell {
    
    func config(model: UserModel) {
        profileImageView.sd_setImage(with: URL(string: model.thumbnailImage))
        nameLabel.text = K.Ui.labelPadding + model.firstName + " " + model.lastName
        locationLabel.text = K.Ui.labelPadding + model.country
    }
}
