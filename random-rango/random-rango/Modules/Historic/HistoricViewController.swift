//
//  HistoricViewController.swift
//  random-rango
//
//  Created by William Zabot on 21/10/21.
//

import Foundation
import UIKit


class HistoricViewController : UIViewController{
    
    let historics =  ["Texto1", "texto2", "texto3", "texto4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let frameViewPai = self.view.frame
        let historicView = HistoricView(frame: frameViewPai)
        self.view.addSubview(historicView)
        historicView.historicTableView.dataSource = self
    }
}

extension HistoricViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let historicCell = RangoCustomCell(frame: cell.frame)
        historicCell.setText(text: historics[indexPath.row])
        cell.addSubview(historicCell)
        return cell
    }
}
