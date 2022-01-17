//
//  LoginViewController.swift
//  random-rango
//
//  Created by Fleury on 24/10/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var separatorLabel: UILabel!
    @IBOutlet weak var socialMediaFirstImage: UIImageView!
    @IBOutlet weak var socialMediaSecondImage: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotPassButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var historicButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollContentView: UIView!
    
    let router: LoginRouter
    
    enum Route: String {
        case login
        case forgotPass
        case signUp
        case sugestion
        case historic
    }
    
    public init(router: LoginRouter) {
        self.router = router
        super.init(nibName: "LoginViewController", bundle: Bundle(for: LoginViewController.self))
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
        scrollView.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
        scrollContentView.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
        separatorLabel.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
        logoImage.image = UIImage(named: "appLogo")
        socialMediaFirstImage.image = UIImage(named: "googleLogoG")
        socialMediaSecondImage.image = UIImage(named: "facebookLogo")
        forgotPassButton.tintColor = UIColor(red: 0.90, green: 0.34, blue: 0.34, alpha: 1.00)
        signUpButton.tintColor = UIColor(red: 0.90, green: 0.34, blue: 0.34, alpha: 1.00)
        historicButton.tintColor = UIColor(red: 0.90, green: 0.34, blue: 0.34, alpha: 1.00)
        
        loginButton.tintColor = UIColor(red: 1.00, green: 0.95, blue: 0.74, alpha: 1.00)
        loginButton.backgroundColor = UIColor(red: 0.89, green: 0.24, blue: 0.25, alpha: 0.80)
        loginButton.layer.cornerRadius = 25.0
        
        textFieldUI(textFieldNeeded: emailTextField)
        textFieldUI(textFieldNeeded: passwordTextField)
        
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
    }
    
    func textFieldUI(textFieldNeeded: UITextField) {
        textFieldNeeded.layer.cornerRadius = 25.0
        textFieldNeeded.layer.borderWidth = 1
        textFieldNeeded.layer.borderColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00).cgColor
        textFieldNeeded.clipsToBounds = true
    }
    
    @IBAction func forgotPassButtonAction(_ sender: Any) {
        self.router.route(to: Route.forgotPass.rawValue, from: self, parameters: nil)
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        self.router.route(to: Route.login.rawValue, from: self, parameters: nil)
    }
    
    @IBAction func signUpButtonAction(_ sender: Any) {
        self.router.route(to: Route.signUp.rawValue, from: self, parameters: nil)
    }
    
    @IBAction func historicButtonAction(_ sender: Any) {
        self.router.route(to: Route.historic.rawValue, from: self, parameters: nil)
    }
    
}
