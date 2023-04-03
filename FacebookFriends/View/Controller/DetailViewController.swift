//
//  DetailViewController.swift
//  FacebookFriends
//
//  Created by Sinan Ulusoy on 31.03.2023.
//

import UIKit
import SnapKit
import MapKit


final class DetailViewController: UIViewController {
    
    let userModel: UserModel!
    private let profileImageView = UIImageView()
    private let labelStackView = UIStackView()
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    private let locationLabel = UILabel()
    private let phoneLabel = UILabel()
    private let ageLabel = UILabel()
    private let mapView = MKMapView()

    init(_ userModel: UserModel) {
        self.userModel = userModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    private func setupView() {
        view.backgroundColor = K.Color.bg1
        
        navigationController?.navigationBar.tintColor = K.Color.text
        
        profileImageView.sd_setImage(with: URL(string: userModel.largeImage))
        profileImageView.backgroundColor = K.Color.bg2
        profileImageView.layer.cornerRadius = K.Ui.cornerRadius2
        profileImageView.layer.masksToBounds = true
        
        labelStackView.axis = .vertical
        labelStackView.alignment = .fill
        labelStackView.distribution = .fillEqually
        labelStackView.spacing = 10

        nameLabel.backgroundColor = K.Color.bg2
        nameLabel.textColor = K.Color.text
        nameLabel.layer.cornerRadius = K.Ui.cornerRadius2
        nameLabel.layer.masksToBounds = true
        nameLabel.text = K.Ui.labelPadding + K.DetailVC.nameLabel + ": " +
            userModel.title + " " + userModel.firstName + " " + userModel.lastName

        emailLabel.backgroundColor = .red
        emailLabel.backgroundColor = K.Color.bg2
        emailLabel.textColor = K.Color.text
        emailLabel.layer.cornerRadius = K.Ui.cornerRadius2
        emailLabel.layer.masksToBounds = true
        emailLabel.text = K.Ui.labelPadding + K.DetailVC.emailLabel + ": " + userModel.email

        locationLabel.backgroundColor = .red
        locationLabel.backgroundColor = K.Color.bg2
        locationLabel.textColor = K.Color.text
        locationLabel.layer.cornerRadius = K.Ui.cornerRadius2
        locationLabel.layer.masksToBounds = true
        locationLabel.text = K.Ui.labelPadding + K.DetailVC.locationLabel + ": " +
            userModel.city + ", " + userModel.country

        phoneLabel.backgroundColor = .red
        phoneLabel.backgroundColor = K.Color.bg2
        phoneLabel.textColor = K.Color.text
        phoneLabel.layer.cornerRadius = K.Ui.cornerRadius2
        phoneLabel.layer.masksToBounds = true
        phoneLabel.text = K.Ui.labelPadding + K.DetailVC.phoneLabel + ": " + userModel.phone

        ageLabel.backgroundColor = .red
        ageLabel.backgroundColor = K.Color.bg2
        ageLabel.textColor = K.Color.text
        ageLabel.layer.cornerRadius = K.Ui.cornerRadius2
        ageLabel.layer.masksToBounds = true
        ageLabel.text = K.Ui.labelPadding + K.DetailVC.ageLabel + ": " + userModel.age

        let coordinate = CLLocationCoordinate2D(
            latitude: userModel.latitude,
            longitude: userModel.longitude
        )
        mapView.setRegion(
            MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(
                    latitudeDelta: 0.1,
                    longitudeDelta: 0.1
                )
            ),
            animated: false
        )
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        pin.title = userModel.firstName
        mapView.addAnnotation(pin)
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.center = view.center
        mapView.layer.cornerRadius = K.Ui.cornerRadius1
        mapView.layer.masksToBounds = true
    }
    
    private func setupHierarchy() {
        view.addSubview(
            profileImageView,
            labelStackView,
            mapView
        )
        
        labelStackView.addArrangedSubview(nameLabel)
        labelStackView.addArrangedSubview(emailLabel)
        labelStackView.addArrangedSubview(locationLabel)
        labelStackView.addArrangedSubview(phoneLabel)
        labelStackView.addArrangedSubview(ageLabel)
    }
    
    private func setupLayout() {
        profileImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.width.equalTo(view.snp.height).multipliedBy(0.25)
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        labelStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(profileImageView.snp.bottom).offset(32)
            make.bottom.equalTo(mapView.snp.top).offset(-32)
        }
        
        mapView.snp.makeConstraints { make in
            make.height.equalTo(view).multipliedBy(0.25)
            make.leading.trailing.equalTo(labelStackView)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
