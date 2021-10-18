//
//  TextFieldCell.swift
//  random-rango
//
//  Created by Renato on 18/10/21.
//

import UIKit

class TextFieldCell: UITableViewCell {

    @IBOutlet weak var inputData: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    func setupUI() {
        contentView.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
        inputData.layer.cornerRadius = 25.0
        inputData.layer.borderWidth = 1
        inputData.layer.borderColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00).cgColor
        inputData.clipsToBounds = true
    }
    
    func setup(placeholder: String) {
        inputData.placeholder = placeholder
    }
}
