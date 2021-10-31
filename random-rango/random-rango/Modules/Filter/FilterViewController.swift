//
//  FilterViewController.swift
//  random-rango
//
//  Created by Rafael Gomes on 21/10/21.
//

import UIKit

class FilterViewController: UIViewController {

    @IBOutlet weak var companhiaSegment: UISegmentedControl!
    @IBOutlet weak var estiloSegment: UISegmentedControl!
    @IBOutlet weak var precoSegment: UISegmentedControl!
    @IBOutlet weak var periodoSegment: UISegmentedControl!
    @IBOutlet weak var buscarButtonLayout: UIButton!
    
    @IBOutlet weak var tituloLabel: UILabel!
    
    let service: FilterService = .init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayer()
    }
    
    func setupLayer() {
    view.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
        
        buttonConfig(buttonNeed: buscarButtonLayout)
        tituloLabel.textColor = UIColor(red: 0.88, green: 0.22, blue: 0.33, alpha: 1.00)
        segmentConfig(segmentNeed: companhiaSegment)
        segmentConfig(segmentNeed: estiloSegment)
        segmentConfig(segmentNeed: precoSegment)
        segmentConfig(segmentNeed: periodoSegment)
  
    }
    
    func buttonConfig(buttonNeed: UIButton){
        buscarButtonLayout.layer.cornerRadius = 25.0
        buscarButtonLayout.layer.borderWidth = 1
        buscarButtonLayout.layer.borderColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00).cgColor
        buscarButtonLayout.clipsToBounds = true
        buscarButtonLayout.layer.borderColor = UIColor.clear.cgColor
        buscarButtonLayout.backgroundColor = UIColor(red: 0.89, green: 0.24, blue: 0.25, alpha: 0.80)
        buscarButtonLayout.tintColor = UIColor(red: 1.00, green: 0.95, blue: 0.74, alpha: 1.00)
    }
    
    func segmentConfig(segmentNeed: UISegmentedControl){
        segmentNeed.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.89, alpha: 1.00)
        segmentNeed.selectedSegmentTintColor = UIColor(red: 0.88, green: 0.22, blue: 0.33, alpha: 1.00)
        segmentNeed.tintColor = UIColor(red: 1.00, green: 0.95, blue: 0.74, alpha: 1.00)
        segmentNeed.layer.borderColor = CGColor(red: 0.93, green: 0.67, blue: 0.60, alpha: 1.00)
        segmentNeed.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.yellow], for: .normal)
        segmentNeed.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.blue], for: .selected)
        
    }
    
    @IBAction func buscaButtonAction(_ sender: Any) {
        print(service)
    }
}




