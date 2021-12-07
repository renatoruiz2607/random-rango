//
//  LoginViewModel.swift
//  random-rango
//
//  Created by Fleury on 07/12/21.
//

import Foundation
import UIKit
import Firebase
import GoogleSignIn
import FacebookCore
import FacebookLogin

protocol LoginViewModelDelegate {
    func googleAuthorized()
    func facebookAuthorized()
}

class LoginViewModel {
    
    var delegate: LoginViewModelDelegate?
    
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
                self.delegate?.facebookAuthorized()
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
//            if let user = Auth.auth().currentUser {}
        }
    }
    
}
