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
            let vm = LoginViewModel(profile: [])
            let router = LoginRouter()
            let vc = LoginViewController(router: router, viewModel: vm)
            context.navigationController?.show(vc, sender: nil)
        case .signUp:
            let vc = RegisterViewController()
        case .forgotPass:
            let vc = HistoricViewController()
            context.navigationController?.show(vc, sender: nil)
        case .sugestion:
            break
        }
    }
}
