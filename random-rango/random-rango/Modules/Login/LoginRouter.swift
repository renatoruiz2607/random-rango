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
//            let vm =
//            let router =
//            let vc = HomeViewController(router: HomeRouter())
            let vc = FilterViewController(router: FilterRouter(), viewModel: FilterViewModel())
//            let vc = ForgotPasswordViewController()
//            vc.modalPresentationStyle = .fullScreen
            context.navigationController?.show(vc, sender: nil)
        case .signUp:
//            let vm =
//            let router =
            let vc = RegisterViewController()
//            vc.modalPresentationStyle = .fullScreen
            context.navigationController?.show(vc, sender: nil)
        case .forgotPass:
//            let vm =
//            let router =
            let vc = ForgotPasswordViewController(router: ForgotPassRouter())
//            vc.modalPresentationStyle = .fullScreen
            context.navigationController?.show(vc, sender: nil)
        case .sugestion:
//            let vm =
//            let router =
            let vc = SugestionViewController()
//            vc.modalPresentationStyle = .fullScreen
            context.navigationController?.show(vc, sender: nil)
        case .historic:
//            let vm =
//            let router =
            let vc = HomeViewController(router: HomeRouter())
//            vc.modalPresentationStyle = .fullScreen
            context.navigationController?.show(vc, sender: nil)
        }
    }
    
}
