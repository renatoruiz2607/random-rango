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
//            guard let profileImage = parameters as? String else {
//                assertionFailure("Parameter type cast fail!")
//                return
//            }
            
//            let vm = HomeViewModel(profileImage: profileImage)
//            let router = HomeRouter()
//            let vc = HomeViewController(router: router, viewModel: vm)
            let vc = HistoricViewController()
//            vc.modalPresentationStyle = .fullScreen
            context.navigationController?.show(vc, sender: nil)
        }
    }
    
}
