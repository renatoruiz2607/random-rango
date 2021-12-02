//
//  SugestaoService.swift
//  random-rango
//
//  Created by Fleury on 15/11/21.
//

import Foundation

class SugestaoService {
    
    func downloadFromUrl(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
}
