//
//  IntroRouter.swift
//  random-rango
//
//  Created by Renato on 20/10/21.
//

import Foundation
import UIKit

class IntroRouter {
    
    func route(to routeID: String, from context: UIViewController, parameters: Any?) {
        
        guard let route = IntroViewController.Route(rawValue: routeID) else { return }
        
        switch route {
        case .skip:
//            let vm =
//            let router =
            let vc = LoginViewController(router: LoginRouter(), viewModel: LoginViewModel())
//            vc.modalPresentationStyle = .fullScreen
//            context.navigationController?.show(vc, sender: nil)
//            context.show(vc, sender: nil)
            context.navigationController?.show(vc, sender: nil)
        }
    }
    
}
