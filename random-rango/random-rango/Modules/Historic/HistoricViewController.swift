//
//  HistoricViewController.swift
//  random-rango
//
//  Created by William Zabot on 21/10/21.
//

import Foundation
import UIKit


class HistoricViewController : UIViewController {
    
    var historics : [Restaurant] = []
    let historicViewModel = HistoricViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let frameViewPai = self.view.frame
        let historicView = HistoricView(frame: frameViewPai)
        self.view.addSubview(historicView)
        historicView.historicTableView.dataSource = self
        historicView.historicTableView.delegate = self
        historicView.historicTableView.register(HistoricCell.self, forCellReuseIdentifier: "historicCell")
        
        historics = historicViewModel.getRestaurants()
    }
}

extension HistoricViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "historicCell", for: indexPath) as? HistoricCell {
            cell.backgroundColor = .clear
            let historicCell = RangoCustomCell(frame: CGRect.init(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height))
            historicCell.setHistoric(historic: historics[indexPath.row])
            cell.addSubview(historicCell)
            return cell
        }
        return UITableViewCell()
    }
}

extension HistoricViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
