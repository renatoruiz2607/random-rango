//
//  HistoricView.swift
//  random-rango
//
//  Created by William Zabot on 21/10/21.
//

import UIKit

class HistoricView : UIView, UITableViewDataSource {
    
    var historics : [String] = []
    
    private let header : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "appLogo")
        return image
    }()
    
    private let subtitle : UILabel = {
        let label = UILabel()
        label.text = "Meus últimos rangos"
        label.textAlignment = .center
        label.textColor = .red
        return label
    }()
    
    private let historicTableView = UITableView()
    
    
    private let backButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Voltar", for: .normal)
        button.setTitleColor(UIColor.yellow, for: .normal)
        button.layer.cornerRadius = 16
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
        self.historicTableView.dataSource = self
        initView()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initView() {
        self.addSubview(header)
        self.addSubview(subtitle)
        self.addSubview(historicTableView)
        self.addSubview(backButton)
    }
    
    private func initConstraints() {
        header.translatesAutoresizingMaskIntoConstraints = false
        header.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        header.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        header.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
        
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 15).isActive = true
        subtitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        subtitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
        
        historicTableView.translatesAutoresizingMaskIntoConstraints = false
        historicTableView.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 20).isActive = true
        historicTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        historicTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: historicTableView.bottomAnchor, constant: 20).isActive = true
        backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 70).isActive = true
        backButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -70).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let historicCell = RangoCustomCell(frame: cell.frame)
        historicCell.texto = historics[indexPath.row]
        cell.addSubview(historicCell)
        return cell
    }
    
}

