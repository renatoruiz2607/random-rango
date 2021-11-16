//
//  SugestaoViewModel.swift
//  random-rango
//
//  Created by Fleury on 15/11/21.
//

import Foundation
import UIKit

class SugestaoViewModel {
    
    let service: SugestaoService = .init()
    
    func downloadFromUrl(image: String, imageView: UIImageView) -> UIImageView {
        if let url = URL(string: image) {
            service.downloadFromUrl(from: url) { data, _, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async { [unowned self] in
                    return imageView.image = UIImage(data: data) ?? UIImage()
                }
            }
        }
        return UIImageView()
    }
    
}
