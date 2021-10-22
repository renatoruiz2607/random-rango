//
//  HistoricViewController.swift
//  random-rango
//
//  Created by William Zabot on 21/10/21.
//

import Foundation
import UIKit


class HistoricViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let frameViewPai = self.view.frame
        let historicView = HistoricView(frame: frameViewPai)
        historicView.historics = ["Texto1", "texto2", "texto3", "texto4"]
        self.view.addSubview(historicView)
    }
}
