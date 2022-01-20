//
//  HomeRouter.swift
//  random-rango
//
//  Created by Renato on 18/10/21.
//

import Foundation
import UIKit

class HomeRouter {
    
    func route(to routeID: String, from context: UIViewController, parameters: Any?) {
        
        guard let route = HomeViewController.Route(rawValue: routeID) else { return }
        
        switch route {
        case .login:
//            let vm =
//            let router =
            let vc = LoginViewController(router: LoginRouter(), viewModel: LoginViewModel(profile: []))
//            let vc = ForgotPasswordViewController()
//            vc.modalPresentationStyle = .fullScreen
//            vc.view.backgroundColor = .white
            context.navigationController?.show(vc, sender: nil)
        case .signUp:
//            let vm =
//            let router =
            let vc = RegisterViewController()
//            vc.modalPresentationStyle = .fullScreen
//            context.navigationController?.show(vc, sender: nil)
        case .forgotPass:
//            let vm =
//            let router =
            let vc = HistoricViewController()
//            vc.modalPresentationStyle = .fullScreen
            context.navigationController?.show(vc, sender: nil)
        case .sugestion:
//            let vm =
//            let router =
            let vc = SugestionViewController()
//            vc.modalPresentationStyle = .fullScreen
            context.navigationController?.show(vc, sender: nil)
        }
    }
}
