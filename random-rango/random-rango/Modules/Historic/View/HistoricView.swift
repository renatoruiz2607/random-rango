//
//  HistoricView.swift
//  random-rango
//
//  Created by William Zabot on 21/10/21.
//

import UIKit

class HistoricView : UIView{
    
    private var historics : [String] = []
    
    private let red = UIColor(red: 0.76, green: 0.30, blue: 0.29, alpha: 1.00)
    
    private let header : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "appLogo")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var subtitle : UILabel = {
        let label = UILabel()
        label.text = "Meus últimos rangos"
        label.textAlignment = .center
        label.textColor = red
        return label
    }()
    
    public let historicTableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
        return tableView
    }()
    
    
    private lazy var backButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = red
        button.setTitle("Voltar", for: .normal)
        let yellow = UIColor(red: 1.00, green: 0.95, blue: 0.74, alpha: 1.00)
        button.setTitleColor(yellow, for: .normal)
        button.layer.cornerRadius = 25
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
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
        header.heightAnchor.constraint(equalToConstant: 60).isActive = true
        header.topAnchor.constraint(equalTo: self.topAnchor, constant: 70).isActive = true
        header.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        header.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
        
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10).isActive = true
        subtitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        subtitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
        
        historicTableView.translatesAutoresizingMaskIntoConstraints = false
        historicTableView.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 20).isActive = true
        historicTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        historicTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        historicTableView.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: 0).isActive = true
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive = true
        backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100).isActive = true
        backButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100).isActive = true
    }
    
    
    
}

