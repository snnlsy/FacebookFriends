//
//  FriendsViewController.swift
//  FacebookFriends
//
//  Created by Sinan Ulusoy on 31.03.2023.
//

import UIKit
import SnapKit
import RealmSwift

class Student : Object {
    @objc dynamic var id: String = ""
    let testScores = List<String>()
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

final class FriendsViewController: UIViewController {

    private let username: String!
    private let friendsCollectionView = UICollectionView(
        frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()
    )
    private let friendsVM = FriendsViewModel()
    
    init(username: String) {
        self.username = username
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    private func setup() {
        friendsVM.config(username)
        friendsVM.reloadData = { [weak self] in
            self?.friendsCollectionView.reloadDataAsync()
        }
        friendsVM.errorMessage = { [weak self] err in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                Toast.show(message: err, vc: self)
            }
        }
    }
    
    private func setupView() {
        title = K.FriendsVC.title
        navigationItem.hidesBackButton = true
        let exitImage = UIImage(systemName: "pip.exit")
        let rightButtonItem = UIBarButtonItem(
            image: exitImage,
            style: .plain,
            target: self,
            action: #selector(didExitButtonTap))
        rightButtonItem.tintColor = K.Color.text
        navigationItem.rightBarButtonItem = rightButtonItem
        navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: K.Color.text]
        
        friendsCollectionView.delegate = self
        friendsCollectionView.dataSource = self
        friendsCollectionView.register(FriendsCollectionViewCell.self)
        friendsCollectionView.backgroundColor = K.Color.bg1
    }
    
    private func setupHierarchy() {
        view.addSubview(friendsCollectionView)
    }
    
    private func setupLayout() {
        friendsCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FriendsViewController {
    
    @objc private func didExitButtonTap() {
        navigationController?.popViewController(animated: true)
    }
}


extension FriendsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendsVM.userModelListCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FriendsCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.config(model: friendsVM.userModelList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController(friendsVM.userModelList[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension FriendsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: collectionView.frame.size.width / 2.5,
            height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}


extension FriendsViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height

        if maximumOffset - currentOffset <= 50.0 {
            friendsVM.appendNewData()
        }
    }
}
