//
//  FriendsViewModel.swift
//  FacebookFriends
//
//  Created by Sinan Ulusoy on 1.04.2023.
//

import Foundation

protocol FriendsViewModelProtocol: AnyObject {
    func reloadData()
}

final class FriendsViewModel {
    
    weak var delegate: FriendsViewModelProtocol?
    
    private var username: String = ""
    var userModelList: [UserModel] = [] {
        didSet {
            delegate?.reloadData()
        }
    }
    
    var userModelListCount: Int {
        userModelList.count
    }
    
    func config(_ username: String) {
        self.username = username
        fetchData()
    }
    
    private func fetchData() {
        guard let url = URL(string: K.Api.url) else { return }
        
        url.fetchJsonData { [weak self] (result: Result<FriendsModel, APIError>) in
            switch result {
            case .success(let res):
                var userModelList = [UserModel]()
                res.results?.forEach({ model in
                    guard let title = model.name?.title,
                          let firstName = model.name?.first,
                          let lastName = model.name?.last,
                          let age = model.dob?.age,
                          let email = model.email,
                          let phone = model.phone,
                          let country = model.location?.country,
                          let city = model.location?.city,
                          let latitude = model.location?.coordinates?.latitude,
                          let longitude = model.location?.coordinates?.longitude,
                          let thumbnailImage = model.picture?.thumbnail,
                          let largeImage = model.picture?.large else { return }
                    guard let lat = Double(latitude),
                          let lon = Double(longitude) else { return }
                    let userModel = UserModel(
                        title: title, firstName: firstName, lastName: lastName, age: String(age),
                        email: email, phone: phone,
                        country: country, city: city, latitude: lat, longitude: lon,
                        thumbnailImage: thumbnailImage, largeImage: largeImage
                    )
                    userModelList.append(userModel)
                })
                self?.userModelList = userModelList
            case .failure(let err):
                print(err)
            }
        }
    }
}
