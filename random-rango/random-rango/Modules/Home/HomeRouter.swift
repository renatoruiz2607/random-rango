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
            let vc = RegisterViewController()
//            vc.modalPresentationStyle = .fullScreen
            context.navigationController?.show(vc, sender: nil)
        }
    }
}
