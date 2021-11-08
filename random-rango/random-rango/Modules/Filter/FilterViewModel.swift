//
//  FilterViewModel.swift
//  random-rango
//
//  Created by Luiz Felipe Clemente Claro on 31/10/21.
//

import Foundation

protocol FilterViewModelDelegate {
    func showRestaurantSuggestion(suggestion: FilterModel?)
}

class FilterViewModel {
    
    var delegate: FilterViewModelDelegate?
    let service: FilterService = .init()
    

    public func filterAndRandomRestaurant(quantidadePessoas: Int, refeicao: Int, valor: Int, estilo: Int) {
        service.getRestaurant() { restaurants in
            
            let filteredArray = restaurants.filter { restaurant in
                restaurant.quantidadePessoas.rawValue == quantidadePessoas && restaurant.refeicao.rawValue == refeicao &&
                restaurant.valor.rawValue == valor &&
                restaurant.estilo.rawValue == estilo
            }
            
            self.delegate?.showRestaurantSuggestion(suggestion: filteredArray.randomElement())
        }
    }
    
}
