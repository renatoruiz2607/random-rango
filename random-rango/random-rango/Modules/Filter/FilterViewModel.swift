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

    var restaurants: Array<FilterModel> = []
    var filteredArray: Array<FilterModel> = []
    var firstStepArray: Array<FilterModel> = []
    var secondStepArray: Array<FilterModel> = []
    var thirdStepArray: Array<FilterModel> = []
    var resultArray: Array<FilterModel> = []
    
    public func filterAndRandomRestaurant(quantidadePessoas: Int, refeicao: Int, valor: Int, estilo: Int) {
        service.getRestaurant() { model in
            self.restaurants = model
            
            switch quantidadePessoas {
            case 0:
                self.firstStepArray = self.filterQuantidadePessoas(value: 0)
            case 1:
                self.firstStepArray = self.filterQuantidadePessoas(value: 1)
            case 2:
                self.firstStepArray = self.filterQuantidadePessoas(value: 2)
            default:
                debugPrint("Erro switch quantidadePessoas")
            }

            switch refeicao {
            case 0:
                self.secondStepArray = self.filterRefeicao(value: 0)
            case 1:
                self.secondStepArray = self.filterRefeicao(value: 1)
            case 2:
                self.secondStepArray = self.filterRefeicao(value: 2)
            default:
                debugPrint("Erro switch refeicao")
            }

            switch valor {
            case 0:
                self.thirdStepArray = self.filterValor(value: 0)
            case 1:
                self.thirdStepArray = self.filterValor(value: 1)
            case 2:
                self.thirdStepArray = self.filterValor(value: 2)
            default:
                debugPrint("Erro switch valor")
            }
            
            switch estilo {
            case 0:
                self.resultArray = self.filterEstilo(value: 0)
            case 1:
                self.resultArray = self.filterEstilo(value: 1)
            case 2:
                self.resultArray = self.filterEstilo(value: 2)
            default:
                debugPrint("Erro switch estilo")
            }
            
            self.delegate?.showRestaurantSuggestion(suggestion: self.resultArray.randomElement())
            
        }
    }
    
    func filterQuantidadePessoas(value: Int) -> Array<FilterModel> {
        filteredArray = restaurants.filter{ resultado in
                resultado.quantidadePessoas.rawValue == value
            }
        return filteredArray
    }
    
    func filterRefeicao(value: Int) -> Array<FilterModel> {
        filteredArray = firstStepArray.filter{ resultado in
                resultado.refeicao.rawValue == value
            }
        return filteredArray
    }
    
    func filterValor(value: Int) -> Array<FilterModel> {
        filteredArray = secondStepArray.filter{ resultado in
                resultado.valor.rawValue == value
            }
        return filteredArray
    }
    
    func filterEstilo(value: Int) -> Array<FilterModel> {
        filteredArray = thirdStepArray.filter{ resultado in
                resultado.estilo.rawValue == value
            }
        return filteredArray
    }
    
}
