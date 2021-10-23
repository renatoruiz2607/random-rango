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
        criarCadastroButton.backgroundColor = UIColor(red: 0.88, green: 0.22, blue: 0.33, alpha: 1.00)
        view.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
        criarCadastroButton.layer.cornerRadius = 25.0
        criarCadastroButton.layer.borderWidth = 1
        criarCadastroButton.layer.borderColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00).cgColor
        criarCadastroButton.clipsToBounds = true
        
        emailTextField.layer.cornerRadius = 25.0
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00).cgColor
        emailTextField.clipsToBounds = true

        senhaTextField.layer.cornerRadius = 25.0
        senhaTextField.layer.borderWidth = 1
        senhaTextField.layer.borderColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00).cgColor
        senhaTextField.clipsToBounds = true
        
        confirmarSenhaTextField.layer.cornerRadius = 25.0
        confirmarSenhaTextField.layer.borderWidth = 1
        confirmarSenhaTextField.layer.borderColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00).cgColor
        confirmarSenhaTextField.clipsToBounds = true
        
        criarCadastroButton.tintColor = UIColor(red: 1.00, green: 0.95, blue: 0.74, alpha: 1.00)//(red: 0.94, green: 0.59, blue: 0.37, alpha: 1.00)
        }
        
        func setup(title: String, hasBackground: Bool) {
            criarCadastroButton.setTitle(title, for: .normal)
            
            if hasBackground {
                criarCadastroButton.backgroundColor = UIColor(red: 0.88, green: 0.22, blue: 0.33, alpha: 1.00)
                criarCadastroButton.layer.cornerRadius = 25.0
        
        
            }
        }
    }
