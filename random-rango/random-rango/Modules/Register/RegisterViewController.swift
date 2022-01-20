//
//  RegisterViewController.swift
//  random-rango
//
//  Created by Luiz Felipe Clemente Claro on 20/10/21.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var confirmarSenhaTextField: UITextField!
    
    @IBOutlet weak var criarCadastroButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        
        criarCadastroButton.layer.borderColor = UIColor.clear.cgColor
        criarCadastroButton.backgroundColor = UIColor(red: 0.89, green: 0.24, blue: 0.25, alpha: 0.80)
        view.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
        criarCadastroButton.layer.cornerRadius = 25.0
        criarCadastroButton.layer.borderWidth = 1
        criarCadastroButton.layer.borderColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00).cgColor
        criarCadastroButton.clipsToBounds = true

        textFieldConfig(textFieldNeeded: emailTextField)
        textFieldConfig(textFieldNeeded: senhaTextField)
        textFieldConfig(textFieldNeeded: confirmarSenhaTextField)
        
        criarCadastroButton.tintColor = UIColor(red: 1.00, green: 0.95, blue: 0.74, alpha: 1.00)
        }
        
    func textFieldConfig(textFieldNeeded: UITextField) {
        textFieldNeeded.layer.cornerRadius = 25.0
        textFieldNeeded.layer.borderWidth = 1
        textFieldNeeded.layer.borderColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00).cgColor
        textFieldNeeded.clipsToBounds = true
        }
    }
