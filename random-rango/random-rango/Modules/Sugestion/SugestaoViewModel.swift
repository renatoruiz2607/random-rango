//
//  SugestaoViewModel.swift
//  random-rango
//
//  Created by Fleury on 15/11/21.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class SugestaoViewModel {
    
    let imageView = PublishSubject<UIImage>()
    
    let service: SugestaoService = .init()
    
    func downloadFromUrl(image: String) {
        if let url = URL(string: image) {
            service.downloadFromUrl(from: url) { data, _, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async { [unowned self] in
                    imageView.onNext(UIImage(data: data) ?? UIImage())
                }
            }
        }
    }
    
}
