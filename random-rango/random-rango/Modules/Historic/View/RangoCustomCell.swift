//
//  RangoCustomCell.swift
//  random-rango
//
//  Created by William Zabot on 21/10/21.
//

import Foundation
import UIKit

class RangoCustomCell : UIView {
    
    private let red = UIColor(red: 0.76, green: 0.30, blue: 0.29, alpha: 1.00)
    
    private lazy var title : UILabel = {
        let label = UILabel()
        label.textColor = red
        label.textAlignment = .left
        return label
    }()
    
    private lazy var address : UILabel = {
        let label = UILabel()
        label.textColor = red
        label.textAlignment = .left
        return label
    }()
    
    
    private let stars : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
        initConstraints()
    }
    
    private func initView() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 12
        self.addSubview(title)
        self.addSubview(address)
        self.addSubview(stars)
    }
    
    
    private func initConstraints() {
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        
        address.translatesAutoresizingMaskIntoConstraints = false
        address.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8).isActive = true
        address.leadingAnchor.constraint(equalTo: title.leadingAnchor, constant: 0).isActive = true
        
        stars.translatesAutoresizingMaskIntoConstraints = false
        stars.heightAnchor.constraint(equalToConstant: 20).isActive = true
        stars.widthAnchor.constraint(equalToConstant: 80).isActive = true
        stars.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 10).isActive = true
        stars.leadingAnchor.constraint(equalTo: address.leadingAnchor, constant: 0).isActive = true
    }
    
    func setHistoric(historic : Historic){
        title.text = historic.title
        address.text = historic.address
        setStars(num: historic.stars)
    }
    
    private func setStars(num : Int){
        var img = ""
        switch num {
        case 1: img = "oneStar"
        case 2: img = "twoStars"
        case 3: img = "threeStars"
        case 4: img = "fourStars"
        case 5: img = "fiveStars"
        default: img = "oneStar"
        }
        stars.image = UIImage(named: img)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
