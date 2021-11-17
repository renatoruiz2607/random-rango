//
//  HistoricViewModel.swift
//  random-rango
//
//  Created by William Zabot on 17/11/21.
//

import Foundation

class HistoricViewModel {
    
    let coreDataService = CoreDataService()
    
    func getRestaurants() -> [Restaurant] {
        return coreDataService.getRestaurants()
    }
    
}
