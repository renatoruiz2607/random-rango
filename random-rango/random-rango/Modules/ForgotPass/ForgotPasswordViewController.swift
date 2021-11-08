//
//  ForgotPasswordViewController.swift
//  random-rango
//
//  Created by Luiz Felipe Clemente Claro on 22/10/21.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    
    @IBOutlet weak var problemasLabel: UILabel!
    @IBOutlet weak var fraseLabel: UILabel!
    @IBOutlet weak var emailUsuarioTextField: UITextField!
    @IBOutlet weak var enviarLinkButton: UIButton!
    @IBOutlet weak var ouLabel: UILabel!
    @IBOutlet weak var criarNovaContaButton: UIButton!
    
    let router: ForgotPassRouter
    
    enum Route: String {
        case register
    }
    
    public init(router: ForgotPassRouter) {
        self.router = router
        super.init(nibName: "ForgotPasswordViewController", bundle: Bundle(for: ForgotPasswordViewController.self))
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        view.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
        emailUsuarioTextField.layer.borderColor = UIColor.clear.cgColor
        emailUsuarioTextField.layer.cornerRadius = 25.0
        emailUsuarioTextField.layer.borderWidth = 1
        emailUsuarioTextField.layer.borderColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00).cgColor
        emailUsuarioTextField.clipsToBounds = true
        
        enviarLinkButton.tintColor = UIColor(red: 1.00, green: 0.95, blue: 0.74, alpha: 1.00)
        enviarLinkButton.backgroundColor = UIColor(red: 0.89, green: 0.24, blue: 0.25, alpha: 0.80)
        enviarLinkButton.layer.cornerRadius = 25.0
        enviarLinkButton.layer.borderWidth = 1
        enviarLinkButton.layer.borderColor = UIColor.clear.cgColor
        
        criarNovaContaButton.tintColor = UIColor(red: 0.90, green: 0.34, blue: 0.34, alpha: 1.00)
        
        problemasLabel.textColor = UIColor(red: 0.90, green: 0.34, blue: 0.34, alpha: 1.00)
        
        fraseLabel.textColor = UIColor(red: 0.90, green: 0.34, blue: 0.34, alpha: 1.00)
        
        ouLabel.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
    }
    
    @IBAction func criarNovaContaButtonAction(_ sender: Any) {
        self.router.route(to: Route.register.rawValue, from: self, parameters: nil)
    }
    
}
