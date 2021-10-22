//
//  ButtonViewController.swift
//  random-rango
//
//  Created by Luiz Felipe Clemente Claro on 21/10/21.
//

import UIKit

class ButtonViewController: UIViewController {

    @IBOutlet weak var botaoGenerico: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

//class ButtonCell: UITableViewCell {
//
//    @IBOutlet weak var genericButton: UIButton!
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        setupUI()
//    }
//
//    func setupUI() {
//        contentView.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
//        genericButton.tintColor = UIColor(red: 0.94, green: 0.59, blue: 0.37, alpha: 1.00)
//    }
//
//    func setup(title: String, hasBackground: Bool) {
//        genericButton.setTitle(title, for: .normal)
//
//        if hasBackground {
//            genericButton.backgroundColor = UIColor(red: 0.88, green: 0.22, blue: 0.33, alpha: 1.00)
//            genericButton.layer.cornerRadius = 25.0
