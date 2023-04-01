//
//  Toast.swift
//  FacebookFriends
//
//  Created by Sinan Ulusoy on 1.04.2023.
//

import UIKit

class Toast {
    
    static func show(message: String, vc: UIViewController) {
        let toastContainer = UIView(frame: CGRect())
        toastContainer.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        toastContainer.alpha = 0.0
        toastContainer.layer.cornerRadius = 20;
        toastContainer.clipsToBounds  =  true

        let toastLabel = UILabel(frame: CGRect())
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font.withSize(12.0)
        toastLabel.text = message
        toastLabel.clipsToBounds  =  true
        toastLabel.numberOfLines = 0

        toastContainer.addSubview(toastLabel)
        vc.view.addSubview(toastContainer)

        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastContainer.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            toastLabel.topAnchor.constraint(equalTo: toastContainer.topAnchor, constant: 16),
            toastLabel.bottomAnchor.constraint(equalTo: toastContainer.bottomAnchor, constant: -16),
            toastLabel.leadingAnchor.constraint(equalTo: toastContainer.leadingAnchor, constant: 16),
            toastLabel.trailingAnchor.constraint(equalTo: toastContainer.trailingAnchor, constant: -16),
            
            toastContainer.bottomAnchor.constraint(equalTo: vc.view.bottomAnchor, constant: -75),
            toastContainer.leadingAnchor.constraint(equalTo: vc.view.leadingAnchor, constant: 16),
            toastContainer.trailingAnchor.constraint(equalTo: vc.view.trailingAnchor, constant: -16),
        ])
        
        UIView.animate(withDuration: 1, delay: 0.0, options: .curveEaseIn, animations: {
            toastContainer.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 1, delay: 1.5, options: .curveEaseOut, animations: {
                toastContainer.alpha = 0.0
            }, completion: { _ in
                toastContainer.removeFromSuperview()
            })
        })
    }
}
