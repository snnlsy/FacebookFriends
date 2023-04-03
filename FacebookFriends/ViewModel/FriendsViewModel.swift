//
//  FriendsViewModel.swift
//  FacebookFriends
//
//  Created by Sinan Ulusoy on 1.04.2023.
//

import Foundation
import RealmSwift

final class FriendsViewModel {
    
    private var username: String = ""
    private var currentPage: Int = 1
    private var cacheManager = CacheManager.shared
    
    var reloadData: (() -> ())?
    var errorMessage: ((String) -> ())?

    var userModelList: [UserModel] = [] {
        didSet {
            reloadData?()
        }
    }
    
    var userModelListCount: Int {
        userModelList.count
    }
    
    var currentPageStr: String {
        get {
            currentPage += 1
            return String(currentPage)
        }
    }
    
    func config(_ username: String) {
        self.username = username
        appendNewData()
    }
    
    func appendNewData() {
        let userModelListAll = cacheManager.fetch(object: UserModel())
        let friendListModelAll = cacheManager.fetch(object: FriendListModel())
        
        let cachedCurrentUser = friendListModelAll.filter({ $0.id == self.username })
        if cachedCurrentUser.isEmpty {
            fetchData()
            return
        }
        
        let friendsList = cachedCurrentUser.first!.friendList
        let cachedFriendListFlat = friendsList.flatMap { friendId in
            userModelListAll.filter({ $0.id == friendId })
        }
        let cachedFriendList = Array(cachedFriendListFlat)

        let indexEnd = currentPage * K.Api.results
        let indexStart = indexEnd - K.Api.results
        let isIndexEndValid = cachedFriendList.indices.contains(indexEnd-1)
        let isIndexStartValid = cachedFriendList.indices.contains(indexStart)
        if isIndexEndValid && isIndexStartValid {
            let cachedUserModels = cachedFriendList[indexStart ..< indexEnd]
            self.userModelList.append(contentsOf: cachedUserModels)
            currentPage += 1
            return
        }
        fetchData()
    }
    
    private func saveUserModelToDatabase() {
        let friendListModel = FriendListModel()
        friendListModel.id = username
        userModelList.forEach { model in
            if !cacheManager.isExist(type: UserModel(), id: model.id) {
                cacheManager.save(object: model)
            }
            friendListModel.friendList.append(model.id)
        }
        cacheManager.update(object: friendListModel)
    }
    
    private func fetchData() {
        let queryItems = [
            URLQueryItem(name: K.Api.resultsName, value: String(K.Api.results)),
            URLQueryItem(name: K.Api.pageName, value: currentPageStr),
            URLQueryItem(name: K.Api.seedName, value: username)]
        var urlComps = URLComponents(string: K.Api.url)!
        urlComps.queryItems = queryItems
        let url = urlComps.url!
        
        url.fetchJsonData { [weak self] (result: Result<FriendsModel, APIError>) in
            switch result {
            case .success(let res):
                var userModelList = [UserModel]()
                res.results?.forEach({ model in
                    guard let username = model.login?.username,
                          let title = model.name?.title,
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
                    let userModel = UserModel()
                    userModel.id = username
                    userModel.title = title
                    userModel.firstName = firstName
                    userModel.lastName = lastName
                    userModel.age = String(age)
                    userModel.email = email
                    userModel.phone = phone
                    userModel.country = country
                    userModel.city = city
                    userModel.latitude = lat
                    userModel.longitude = lon
                    userModel.thumbnailImage = thumbnailImage
                    userModel.largeImage = largeImage
                    userModelList.append(userModel)
                })
                guard let self = self else { return }
                self.userModelList.append(contentsOf: userModelList)

                // background a al
                DispatchQueue.main.async { [weak self] in
                    self?.saveUserModelToDatabase()
                }

            case .failure(let err):
                self?.currentPage -= 1
                self?.errorMessage?(err.localizedDescription)
            }
        }
    }
}
