//
//  SugestaoViewController.swift
//  random-rango
//
//  Created by Luiz Felipe Clemente Claro on 02/11/21.
//

import UIKit
import RxCocoa
import RxSwift

class SugestaoViewController: UIViewController {
    
    @IBOutlet weak var restauranteImagemImageView: UIImageView!
    @IBOutlet weak var restauranteTituloLabel: UILabel!
    @IBOutlet weak var restauranteDescricaoLabel: UILabel!
    @IBOutlet weak var atualizarButtonLayout: UIButton!
    
    private let disposeBag = DisposeBag()
    
    var restaurantImage = UIImageView()
    
    var suggestion: FilterModel?
    let viewModel: SugestaoViewModel

    init(suggestion: FilterModel?, viewModel: SugestaoViewModel) {
        self.suggestion = suggestion
        self.viewModel = viewModel
        super.init(nibName: "SugestaoViewController", bundle: Bundle(for: SugestaoViewController.self))
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
        loadSuggestionData()
    }
    
    func setupUI() {
        view.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
        buttonConfig(buttonNeed: atualizarButtonLayout)
        labelsConfig(labelNeed: restauranteTituloLabel)
        labelsConfig(labelNeed: restauranteDescricaoLabel)
        
        setupLogo(logo: UIImage(named: "Restaurante logo"))
    }
    
    func setupBindings() {
        viewModel.imageView
            .asObservable()
            .subscribe(onNext: { imageView in
                self.setupLogo(logo: imageView)
            }).disposed(by: disposeBag)
    }
    
    func setupLogo(logo: UIImage?) {
        restauranteImagemImageView.image = logo
        restauranteImagemImageView.layer.borderWidth = 1
        restauranteImagemImageView.layer.borderColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00).cgColor
        restauranteImagemImageView.layer.borderColor = UIColor.clear.cgColor
        restauranteImagemImageView.layoutIfNeeded()
        restauranteImagemImageView.layer.cornerRadius = restauranteImagemImageView.bounds.width / 2
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

        viewModel.downloadFromUrl(image: suggestion?.image ?? "")
        
    }
    
}
