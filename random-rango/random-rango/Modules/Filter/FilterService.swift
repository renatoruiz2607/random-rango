//
//  FilterService.swift
//  random-rango
//
//  Created by Luiz Felipe Clemente Claro on 31/10/21.
//

import Foundation

class FilterService {
    
    let url = "https://demo6610750.mockable.io/restaurants"
    
    func getRestaurant(completion: @escaping ([FilterModel]) -> Void) {
        let session = URLSession.shared
        let url = URL(string: url)!
        let task = session.dataTask(with: url){ data,response,error in
            do{
                let restaurants = try JSONDecoder().decode([FilterModel].self, from: data ?? Data())
                completion(restaurants)
            } catch {
                print("json error: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
    
}
