//
//  FilterViewController.swift
//  random-rango
//
//  Created by Rafael Gomes on 21/10/21.
//

import UIKit
import RxSwift

class FilterViewController: UIViewController {

    @IBOutlet weak var quantidadePessoasSegment: UISegmentedControl!
    @IBOutlet weak var refeicaoSegment: UISegmentedControl!
    @IBOutlet weak var valorSegment: UISegmentedControl!
    @IBOutlet weak var estiloSegment: UISegmentedControl!
    @IBOutlet weak var buscarButtonLayout: UIButton!
    @IBOutlet weak var tituloLabel: UILabel!

    let router: FilterRouter
    let viewModel: FilterViewModel
    
    enum Route: String {
        case suggestion
    }
    
    public init(router: FilterRouter, viewModel: FilterViewModel) {
        self.router = router
        self.viewModel = viewModel
        super.init(nibName: "FilterViewController", bundle: Bundle(for: FilterViewController.self))
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setup()
    }
    
    func setup() {
        view.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
        buttonConfig(buttonNeeded: buscarButtonLayout)
        tituloLabel.textColor = UIColor(red: 0.88, green: 0.22, blue: 0.33, alpha: 1.00)
        segmentConfig(segmentNeeded: quantidadePessoasSegment)
        segmentConfig(segmentNeeded: estiloSegment)
        segmentConfig(segmentNeeded: valorSegment)
        segmentConfig(segmentNeeded: refeicaoSegment)
    }
    
    public func buttonConfig(buttonNeeded: UIButton){
        buscarButtonLayout.layer.cornerRadius = 25.0
        buscarButtonLayout.layer.borderWidth = 1
        buscarButtonLayout.layer.borderColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00).cgColor
        buscarButtonLayout.clipsToBounds = true
        buscarButtonLayout.layer.borderColor = UIColor.clear.cgColor
        buscarButtonLayout.backgroundColor = UIColor(red: 0.89, green: 0.24, blue: 0.25, alpha: 0.80)
        buscarButtonLayout.tintColor = UIColor(red: 1.00, green: 0.95, blue: 0.74, alpha: 1.00)
    }
    
    func segmentConfig(segmentNeeded: UISegmentedControl){
        segmentNeeded.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.89, alpha: 1.00)
        segmentNeeded.selectedSegmentTintColor = UIColor(red: 0.89, green: 0.24, blue: 0.25, alpha: 0.80)
        segmentNeeded.tintColor = UIColor(red: 1.00, green: 0.95, blue: 0.74, alpha: 1.00)
        segmentNeeded.layer.borderColor = CGColor(red: 0.93, green: 0.67, blue: 0.60, alpha: 1.00)
        segmentNeeded.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0.88, green: 0.22, blue: 0.33, alpha: 1.00)], for: .normal)
        segmentNeeded.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 1.00, green: 0.95, blue: 0.74, alpha: 1.00)], for: .selected)
    }
    
    @IBAction func buscaButtonAction(_ sender: Any) {
        viewModel.filterAndRandomRestaurant(quantidadePessoas: quantidadePessoasSegment.selectedSegmentIndex, refeicao: refeicaoSegment.selectedSegmentIndex, valor: valorSegment.selectedSegmentIndex, estilo: estiloSegment.selectedSegmentIndex)
    }
}

extension FilterViewController: FilterViewModelDelegate {
    func showRestaurantSuggestion(suggestion: FilterModel?) {
        DispatchQueue.main.async { [self] in
            self.router.route(to: Route.suggestion.rawValue, from: self, parameters: suggestion)
        }
    }
}
