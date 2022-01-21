//
//  LoginViewModel.swift
//  random-rango
//
//  Created by Fleury on 07/12/21.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn
import FacebookCore
import FacebookLogin

protocol LoginViewModelDelegate {
    func googleAuthorized()
    func facebookAuthorized()
    func emailPassAuthorized()
    func showAlert(alert: UIAlertController)
}

class LoginViewModel {
    
    var delegate: LoginViewModelDelegate?
    var profile: Array<String>

    init(profile: Array<String>) {
        self.profile = profile
    }
    
    func authAndSignInGoogle(user: GIDGoogleUser) {
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
            self.profile = [Auth.auth().currentUser?.displayName ?? "", Auth.auth().currentUser?.photoURL?.absoluteString ?? ""]
            self.delegate?.googleAuthorized()
        }
    }
    
    func authAndSignInFacebook(result: LoginManagerLoginResult?) {
        switch result {
        case .none:
            print("Ocorreu um erro")
        case .some(let loginResult):
            if let token = loginResult.token?.tokenString {
                loginFacebookNoFirebase(accessToken: token)
            }
        }
    }
    
    
    private func loginFacebookNoFirebase(accessToken: String) {
        let credential = FacebookAuthProvider.credential(withAccessToken: accessToken)
        
        Auth.auth().signIn(with: credential) { result, error in
            if let error = error {
                print ("Erro ao logar no firebase")
            }
            print("Usuário efetuou login no Firebase")
            let photoUrl = Auth.auth().currentUser?.photoURL?.absoluteString ?? ""
            let fbPhotoUrl = "\(photoUrl)?height=500&access_token=\(accessToken)"
            self.profile = [Auth.auth().currentUser?.displayName ?? "", fbPhotoUrl]
            self.delegate?.facebookAuthorized()
        }
    }
    
    func loginWithEmailAndPass(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            
            guard error == nil else {
                print(error)
                self.createFirebaseAccount(email: email, password: password)
                return
            }
            print("<<<<<O usuário fez login com sucesso!")
            self.profile = [email, ""]
            self.delegate?.emailPassAuthorized()
        }
    }
    
    private func createFirebaseAccount(email: String, password: String) {
        let alert = UIAlertController(
            title: "Criar uma nova conta",
            message: "Você deseja criar uma nova conta?",
            preferredStyle: .alert
        )
        
        let continuarAction = UIAlertAction(
            title: "Continuar",
            style: .default) {  [weak self] _ in
                guard let self = self else { return }
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    guard error == nil else {
                        print("<<<<<Erro ao criar a conta")
                        return
                    }
                    print("<<<<<Sucesso na criação de conta e login efetuado!")
                    self.profile = [email, ""]
                    self.delegate?.emailPassAuthorized()
                }
            }
        
        let cancelarAction = UIAlertAction(
            title: "Cancelar",
            style: .cancel) { _ in
                // retornar
            }
        
        alert.addAction(continuarAction)
        alert.addAction(cancelarAction)
        
        self.delegate?.showAlert(alert: alert)
    }
    
    func validateEmail(text: String?)->Bool{
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return validateRegex.evaluate(with: text)
    }
    
    func validatePassword(text: String?)->Bool{
        let passwordRegex = ".{6,}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return validateRegex.evaluate(with: text)
    }
    
}
