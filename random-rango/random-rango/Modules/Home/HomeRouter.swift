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
        case .historic:
            let vc = HistoricViewController()
            context.navigationController?.show(vc, sender: nil)
        case .filter:
            let vm = FilterViewModel()
            let router = FilterRouter()
            let vc = FilterViewController(router: router, viewModel: vm)
            context.navigationController?.show(vc, sender: nil)
        }
    }
    
    func popBack(from context: UIViewController) {
        context.navigationController?.popViewController(animated: true)
    }
}
