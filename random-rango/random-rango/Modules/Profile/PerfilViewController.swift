//
//  PerfilViewController.swift
//  random-rango
//
//  Created by Luiz Felipe Clemente Claro on 16/11/21.
//

import UIKit

class PerfilViewController: UIViewController {
    
    @IBOutlet weak var logOutButtonLayout: UIButton!
    @IBOutlet weak var usuarioLabel: UILabel!
    @IBOutlet weak var imagemPerfilLayout: UIImageView!
    
    @IBOutlet weak var myInfosView: UIView!
    @IBOutlet weak var myInfosLabel: UILabel!
    @IBOutlet weak var myInfosImage: UIImageView!
    
    @IBOutlet weak var experienceView: UIView!
    @IBOutlet weak var experienceLabel: UILabel!
    @IBOutlet weak var experienceImage: UIImageView!
    
    @IBOutlet weak var lastRestaurantView: UIView!
    @IBOutlet weak var lastrestaurantLabel: UILabel!
    @IBOutlet weak var lastRestaurantImage: UIImageView!
    
    @IBOutlet weak var helpView: UIView!
    @IBOutlet weak var helpLabel: UILabel!
    @IBOutlet weak var helpImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    func setupUI() {
        view.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
        
        logOutButtonLayout.tintColor = UIColor(red: 1.00, green: 0.95, blue: 0.74, alpha: 1.00)
        logOutButtonLayout.backgroundColor = UIColor(red: 0.89, green: 0.24, blue: 0.25, alpha: 0.80)
        logOutButtonLayout.layer.cornerRadius = 25.0
        logOutButtonLayout.layer.borderWidth = 1
        logOutButtonLayout.layer.borderColor = UIColor.clear.cgColor

        imagemPerfilLayout.layer.cornerRadius = 53
        imagemPerfilLayout.layer.borderWidth = 3
        imagemPerfilLayout.layer.borderColor = UIColor(red: 0.90, green: 0.34, blue: 0.34, alpha: 1.00).cgColor
        imagemPerfilLayout.image = UIImage(named: "user")
        imagemPerfilLayout.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.55)
        
        labelConfig(labelNeed: lastrestaurantLabel)
        labelConfig(labelNeed: myInfosLabel)
        labelConfig(labelNeed: experienceLabel)
        labelConfig(labelNeed: helpLabel)
        labelConfig(labelNeed: usuarioLabel)
        
        myInfosImage.image = UIImage(named: "Arrow 5")
        experienceImage.image = UIImage(named: "Arrow 5")
        lastRestaurantImage.image = UIImage(named: "Arrow 5")
        helpImage.image = UIImage(named: "Arrow 5" )
        
        myInfosView.isUserInteractionEnabled = true
        myInfosView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(myInfosTap)))

        experienceView.isUserInteractionEnabled = true
        experienceView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(experienceTab)))

        lastRestaurantView.isUserInteractionEnabled = true
        lastRestaurantView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(lastrestaurantTab)))

        helpView.isUserInteractionEnabled = true
        helpView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(helpTab)))
        
    }
    
    @objc func myInfosTap() {
        print("TapInfo")
    }
    @objc func experienceTab() {
        print("TapExperience")
    }
    @objc func lastrestaurantTab() {
        print("TapLastrestaurant")
    }
    @objc func helpTab() {
        print("TapHelp")
    }
    
    func labelConfig(labelNeed: UILabel) {
        labelNeed.textColor = UIColor(red: 0.90, green: 0.34, blue: 0.34, alpha: 1.00)
        labelNeed.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        
    }
}
