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

    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    private let locationLabel = UILabel()
    private let phoneLabel = UILabel()
    private let ageLabel = UILabel()
    private let mapView = MKMapView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    private func setup() {
        
    }
    
    private func setupView() {
        view.backgroundColor = .orange
        
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.center = view.center
        
        let coordinate = CLLocationCoordinate2D(
            latitude: 40.728,
            longitude: -74
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
        pin.title = "name"
        mapView.addAnnotation(pin)

        profileImageView.backgroundColor = .red
        nameLabel.backgroundColor = .red
        emailLabel.backgroundColor = .red
        locationLabel.backgroundColor = .red
        phoneLabel.backgroundColor = .red
        ageLabel.backgroundColor = .red
    }
    
    private func setupHierarchy() {
        view.addSubview(
            profileImageView,
            nameLabel,
            emailLabel,
            locationLabel,
            phoneLabel,
            ageLabel,
            mapView
        )
    }
    
    private func setupLayout() {
        profileImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.width.equalTo(view.snp.height).multipliedBy(0.2)
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(30)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(16)
            make.leading.trailing.height.equalTo(nameLabel)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(16)
            make.leading.trailing.height.equalTo(nameLabel)
        }
        
        phoneLabel.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(16)
            make.leading.trailing.height.equalTo(nameLabel)
        }
        
        ageLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneLabel.snp.bottom).offset(16)
            make.leading.trailing.height.equalTo(nameLabel)
        }
        
        mapView.snp.makeConstraints { make in
            make.top.equalTo(ageLabel.snp.bottom).offset(16)
            make.leading.trailing.equalTo(nameLabel)
            make.height.equalTo(view.snp.height).multipliedBy(0.3)
        }
    }
}
