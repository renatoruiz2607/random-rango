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
//    @IBOutlet weak var googleButton: GIDSignInButton!
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
        
        GIDSignIn.sharedInstance().presentingViewController = self
        GIDSignIn.sharedInstance().delegate = self
//        googleButton.isHidden = true
        
//        let loginButton = FBLoginButton(frame: .zero, permissions: [.publicProfile])
        facebookLoginButton.delegate = self
        facebookLoginButton.isHidden = true
//        self.facebookButton.addSubview(loginButton)
        
        setupUI()
        facebookTap()
        googleTap()
    }
    
    func loginFacebookNoFirebase(accessToken: String) {
        
        let credential = FacebookAuthProvider.credential(withAccessToken: accessToken)
        
        Auth.auth().signIn(with: credential) { result, error in
            if let error = error {
                print ("Erro ao logar no firebase")
            }
            print("Usuário efetuou login no Firebase")
//            if let user = Auth.auth().currentUser {}
        }
        
    }
    
    func setupUI() {
        view.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
        scrollView.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
        scrollContentView.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
        separatorLabel.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
        logoImage.image = UIImage(named: "appLogo")
        socialMediaSecondImage.image = UIImage(named: "googleLogoG")
        
//        socialMediaFirstImage.isHidden = true
//        socialMediaSecondImage.isHidden = true
        
        socialMediaFirstImage.image = UIImage(named: "facebookLogo")
        forgotPassButton.tintColor = UIColor(red: 0.94, green: 0.59, blue: 0.37, alpha: 1.00)
        signUpButton.tintColor = UIColor(red: 0.94, green: 0.59, blue: 0.37, alpha: 1.00)
        historicButton.tintColor = UIColor(red: 0.94, green: 0.59, blue: 0.37, alpha: 1.00)
        
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
        print("E-mail do usuário: \(String(describing: user.profile.email)), \nNome do usuário: \(String(describing: user.profile.name))")
        
        guard
            let authentication = user.authentication,
            let idToken = authentication.idToken
        else { return }
        
        let credential = GoogleAuthProvider.credential(
            withIDToken: idToken,
            accessToken: authentication.accessToken
        )
        
        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error { return }
            print("Usuário logado ao Firebase")
            self.router.route(to: Route.login.rawValue, from: self, parameters: nil)
        }
    }
}

extension LoginViewController: LoginButtonDelegate {
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        switch result {
        case .none:
            print("Ocorreu um erro")
        case .some(let loginResult):
            if let token = loginResult.token?.tokenString {
                loginFacebookNoFirebase(accessToken: token)
                self.router.route(to: Route.login.rawValue, from: self, parameters: nil)
            }
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("Usuário deslogou com Facebook")
    }
}
