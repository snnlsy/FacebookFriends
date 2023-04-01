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

        view.backgroundColor = K.Color.bg1
        
        profileImageView.backgroundColor = .red
        
        nameLabel.backgroundColor = K.Color.bg2
        nameLabel.text = "  sdfsdf"
        nameLabel.textColor = K.Color.text
        nameLabel.layer.cornerRadius = K.Ui.cornerRadius2
        nameLabel.layer.masksToBounds = true
        
        emailLabel.backgroundColor = .red
        emailLabel.backgroundColor = K.Color.bg2
        emailLabel.text = "  sdfsdf"
        emailLabel.textColor = K.Color.text
        emailLabel.layer.cornerRadius = K.Ui.cornerRadius2
        emailLabel.layer.masksToBounds = true
        
        locationLabel.backgroundColor = .red
        locationLabel.backgroundColor = K.Color.bg2
        locationLabel.text = "  sdfsdf"
        locationLabel.textColor = K.Color.text
        locationLabel.layer.cornerRadius = K.Ui.cornerRadius2
        locationLabel.layer.masksToBounds = true
        
        phoneLabel.backgroundColor = .red
        phoneLabel.backgroundColor = K.Color.bg2
        phoneLabel.text = "  sdfsdf"
        phoneLabel.textColor = K.Color.text
        phoneLabel.layer.cornerRadius = K.Ui.cornerRadius2
        phoneLabel.layer.masksToBounds = true
        
        ageLabel.backgroundColor = .red
        ageLabel.backgroundColor = K.Color.bg2
        ageLabel.text = "  sdfsdf"
        ageLabel.textColor = K.Color.text
        ageLabel.layer.cornerRadius = K.Ui.cornerRadius2
        ageLabel.layer.masksToBounds = true
        
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
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
