//
//  LoginViewController.swift
//  random-rango
//
//  Created by Fleury on 24/10/21.
//

import UIKit
import Firebase
import GoogleSignIn
import FacebookCore
import FacebookLogin

class LoginViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var separatorLabel: UILabel!
    @IBOutlet weak var facebookButton: UIView!
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

    let facebookLoginButton = FBLoginButton(frame: .zero, permissions: [.publicProfile])
    let viewModel: LoginViewModel
    let router: LoginRouter

    enum Route: String {
        case login
        case forgotPass
        case signUp
        case sugestion
        case historic
    }

    public init(router: LoginRouter, viewModel: LoginViewModel) {
        self.router = router
        self.viewModel = viewModel
        super.init(nibName: "LoginViewController", bundle: Bundle(for: LoginViewController.self))
    }

    required init?(coder: NSCoder) {
        return nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.delegate = self

        GIDSignIn.sharedInstance().presentingViewController = self
        GIDSignIn.sharedInstance().delegate = self

        facebookLoginButton.delegate = self
        facebookLoginButton.isHidden = true

        setupUI()
        facebookTap()
        googleTap()
    }

    func setupUI() {
        view.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)

        scrollView.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
        scrollContentView.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
        separatorLabel.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
        forgotPassButton.tintColor = UIColor(red: 0.94, green: 0.59, blue: 0.37, alpha: 1.00)
        signUpButton.tintColor = UIColor(red: 0.94, green: 0.59, blue: 0.37, alpha: 1.00)
        historicButton.tintColor = UIColor(red: 0.94, green: 0.59, blue: 0.37, alpha: 1.00)

        logoImage.image = UIImage(named: "appLogo")
        socialMediaFirstImage.image = UIImage(named: "facebookLogo")
        socialMediaSecondImage.image = UIImage(named: "googleLogoG")

        loginButton.tintColor = UIColor(red: 1.00, green: 0.95, blue: 0.74, alpha: 1.00)
        loginButton.backgroundColor = UIColor(red: 0.88, green: 0.22, blue: 0.33, alpha: 1.00)
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

    func googleTap() {
        let googleTap = UITapGestureRecognizer(target: self, action: #selector(googleTapWasPressed))
        socialMediaSecondImage.isUserInteractionEnabled = true
        socialMediaSecondImage.addGestureRecognizer(googleTap)
    }

    @objc func googleTapWasPressed() {
        GIDSignIn.sharedInstance().signIn()
    }

    func facebookTap() {
        let facebookTap = UITapGestureRecognizer(target: self, action: #selector(facebookTapWasPressed))
        socialMediaFirstImage.isUserInteractionEnabled = true
        socialMediaFirstImage.addGestureRecognizer(facebookTap)
    }

    @objc func facebookTapWasPressed() {
        facebookLoginButton.sendActions(for: .touchUpInside)
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

extension LoginViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        viewModel.authAndSignInGoogle(user: user)
    }
}

extension LoginViewController: LoginButtonDelegate {
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        viewModel.authAndSignInFacebook(result: result)
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        socialMediaFirstImage.image = UIImage(named: "facebookLogo")
    }
}

extension LoginViewController: LoginViewModelDelegate {
    func googleAuthorized() {
        self.router.route(to: Route.login.rawValue, from: self, parameters: nil)
    }
    
    func facebookAuthorized() {
        self.router.route(to: Route.login.rawValue, from: self, parameters: nil)
        socialMediaFirstImage.image = UIImage(named: "logoutFacebookLogo")
    }
}
