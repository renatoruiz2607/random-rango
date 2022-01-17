//
//  ForgotPassRouter.swift
//  random-rango
//
//  Created by Fleury on 03/11/21.
//

import Foundation
import UIKit

class ForgotPassRouter {
    
    func route(to routeID: String, from context: UIViewController, parameters: Any?) {
        
        guard let route = ForgotPasswordViewController.Route(rawValue: routeID) else { return }
        
        switch route {
        case .register:
//            let vm =
//            let router =
            let vc = InfoUsuarioViewController()
//            vc.modalPresentationStyle = .fullScreen
//            context.navigationController?.show(vc, sender: nil)
//            context.show(vc, sender: nil)
            context.navigationController?.show(vc, sender: nil)
        }
    }
    
}
