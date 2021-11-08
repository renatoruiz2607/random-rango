//
//  SugestaoViewController.swift
//  random-rango
//
//  Created by Luiz Felipe Clemente Claro on 02/11/21.
//

import UIKit

class SugestaoViewController: UIViewController {
    
    @IBOutlet weak var restauranteImagemImageView: UIImageView!
    @IBOutlet weak var restauranteTituloLabel: UILabel!
    @IBOutlet weak var restauranteDescricaoLabel: UILabel!
    @IBOutlet weak var atualizarButtonLayout: UIButton!
    
    var suggestion: FilterModel?

    init(suggestion: FilterModel?) {
        self.suggestion = suggestion
        super.init(nibName: "SugestaoViewController", bundle: Bundle(for: SugestaoViewController.self))
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadSuggestionData()
    }
    
    func setupUI() {
        view.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
        buttonConfig(buttonNeed: atualizarButtonLayout)
        labelsConfig(labelNeed: restauranteTituloLabel)
        labelsConfig(labelNeed: restauranteDescricaoLabel)
        
        restauranteImagemImageView.image = UIImage(named: "Restaurante logo")
        restauranteImagemImageView.layer.cornerRadius = restauranteImagemImageView.bounds.width / 2.1
        restauranteImagemImageView.layer.borderWidth = 1
        restauranteImagemImageView.layer.borderColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00).cgColor
        restauranteImagemImageView.clipsToBounds = true
        restauranteImagemImageView.layer.borderColor = UIColor.clear.cgColor
    }
    
    public func buttonConfig(buttonNeed: UIButton){
        atualizarButtonLayout.layer.cornerRadius = 25.0
        atualizarButtonLayout.layer.borderWidth = 1
        atualizarButtonLayout.layer.borderColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00).cgColor
        atualizarButtonLayout.clipsToBounds = true
        atualizarButtonLayout.layer.borderColor = UIColor.clear.cgColor
        atualizarButtonLayout.backgroundColor = UIColor(red: 0.89, green: 0.24, blue: 0.25, alpha: 0.80)
        atualizarButtonLayout.tintColor = UIColor(red: 1.00, green: 0.95, blue: 0.74, alpha: 1.00)
    }
    
    func labelsConfig(labelNeed: UILabel){
        restauranteDescricaoLabel.textColor = UIColor(red: 0.88, green: 0.22, blue: 0.33, alpha: 1.00)
        restauranteTituloLabel.textColor = UIColor(red: 0.88, green: 0.22, blue: 0.33, alpha: 1.00)
    }
    
    func loadSuggestionData() {
        restauranteTituloLabel.text = suggestion?.nome
        restauranteDescricaoLabel.text = suggestion?.texto
    }
    
}
