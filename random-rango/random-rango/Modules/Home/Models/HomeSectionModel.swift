//
//  HomeSectionModel.swift
//  random-rango
//
//  Created by Renato on 18/10/21.
//

import Foundation
import UIKit

enum HomeSectionModel: Int {

    static var totalSections: Int { return HomeSectionModel.sugestion.rawValue + 1}
    case inputEmail = 0
    case inputPassword = 1
    case forgotPass = 2
    case login = 3
    case signUp = 4
    case sugestion = 5
    
    var rowsSize: CGFloat {
        return UITableView.automaticDimension
    }
}
