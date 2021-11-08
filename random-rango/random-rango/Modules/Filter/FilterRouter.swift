//
//  FilterRouter.swift
//  random-rango
//
//  Created by Fleury on 02/11/21.
//

import Foundation
import UIKit

class FilterRouter {
    
    func route(to routeID: String, from context: UIViewController, parameters: Any?) {
        
        guard let route = FilterViewController.Route(rawValue: routeID) else { return }
        
        switch route{
        case .suggestion:
            guard let suggestion = parameters as? FilterModel? else {
                assertionFailure("Parameter type cast fail!")
                return
            }
            let vc = SugestaoViewController(suggestion: suggestion)
            context.navigationController?.show(vc, sender: nil)
        }
        
    }
    
}
