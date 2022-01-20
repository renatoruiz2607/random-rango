//
//  LoginRouter.swift
//  random-rango
//
//  Created by Fleury on 26/10/21.
//

import Foundation
import UIKit

class LoginRouter {
    
    func route(to routeID: String, from context: UIViewController, parameters: Any?) {
        
        guard let route = LoginViewController.Route(rawValue: routeID) else { return }
        
        switch route {
        case .login:
            guard let profile = parameters as? Array<String> else {
                assertionFailure("Parameter type cast fail!")
                return
            }
            let vm = HomeViewModel(profile: profile)
            let router = HomeRouter()
            let vc = HomeViewController(router: router, viewModel: vm)
            context.navigationController?.show(vc, sender: nil)
        case .signUp:
            let vc = RegisterViewController()
            context.navigationController?.show(vc, sender: nil)
        case .forgotPass:
            let vc = ForgotPasswordViewController(router: ForgotPassRouter())
            context.navigationController?.show(vc, sender: nil)
        case .sugestion:
            break
        case .historic:
            let vc = HistoricViewController()
            context.navigationController?.show(vc, sender: nil)
        }
    }
    
}
