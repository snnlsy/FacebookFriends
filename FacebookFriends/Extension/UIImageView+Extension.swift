//
//  UIImageView+Extension.swift
//  ShoppingApp
//
//  Created by Sinan Ulusoy on 28.03.2023.
//

import UIKit

extension UIImageView {
    
    func load(from url: URL) {
        loadImage(url: url)
    }
    
    func load(from string: String) {
        if let url = URL(string: string) {
            loadImage(url: url)
        }
    }
    
    private func loadImage(url: URL) {
        url.fetchImage { image in
            switch image {
            case .success(let img):
                DispatchQueue.main.async { [weak self] in
                    self?.image = img
                }
            case .failure(let err):
                print(err)
            }
        }
    }
}
