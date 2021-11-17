//
//  CoreDataService.swift
//  random-rango
//
//  Created by William Zabot on 17/11/21.
//

import Foundation
import UIKit

class CoreDataService {
    
    private var restaurants : [Restaurant] = []
    private let context = ((UIApplication.shared.delegate)
                           as! AppDelegate)
        .persistentContainer
        .viewContext
    
    
    func getRestaurants() -> [Restaurant] {
        do {
            restaurants = try context.fetch(Restaurant.fetchRequest())
            return restaurants
        } catch {
           
        }
        return []
    }
    
    func addRestaurant(name: String, text: String) {
        let restaurant = Restaurant(context: context)
        restaurant.name = name
        restaurant.text = text
        saveContext()
    }
    
    func remove(resturant: Restaurant) {
        context.delete(resturant)
        saveContext()
    }
    
    private func saveContext() {
        do {
            try context.save()
        } catch {}
    }
    
    
}
