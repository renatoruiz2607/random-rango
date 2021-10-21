//
//  ExtensionUIView.swift
//  random-rango
//
//  Created by Luiz Felipe Clemente Claro on 20/10/21.
//

import Foundation
import UIKit

extension UIView {
//    func roundCorners(cornerRadius: CGFloat, typeCorners: CACornerMask) {
//        self.layer.cornerRadius = cornerRadius
//        self.layer.maskedCorners = typeCorners
//        self.clipsToBounds = true
//}
    
//    extension CACornerMask {
//        static public let inferiorDireito:CACornerMask = . layerMaxXMinYCorner
//       // static public let
//    }


func roundCorners(cornerRadius: CGFloat, typeCorners: CACornerMask) {
    self.layer.cornerRadius = cornerRadius // tamanho do raio de arredondamento
    self.layer.maskedCorners = typeCorners // qual posição da view que quer setar
    self.clipsToBounds = true
}

}

extension CACornerMask {
static public let inferiorDireito:CACornerMask = .layerMaxXMaxYCorner
static public let inferiorEsquerdo:CACornerMask = .layerMinXMaxYCorner
static public let superiorDireito:CACornerMask = .layerMaxXMinYCorner
static public let superiorEsquerdo:CACornerMask = .layerMinXMinYCorner


}
