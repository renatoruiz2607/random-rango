//
//  InfoUsuarioViewController.swift
//  random-rango
//
//  Created by Luiz Felipe Clemente Claro on 17/11/21.
//

import UIKit

class InfoUsuarioViewController: UIViewController {
    
    @IBOutlet weak var tituloNomeLabel: UILabel!
    @IBOutlet weak var nomeLabel: UILabel!
    
    @IBOutlet weak var tituloUsernameLabel: UILabel!
    @IBOutlet weak var LabelName: UILabel!
    
    @IBOutlet weak var tituloEmailLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var usuarioImageImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    
    }

    func setupUI(){
        
        view.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
        
        labelConfig(labelNeed: tituloNomeLabel)
        labelConfig(labelNeed: LabelName)
        labelConfig(labelNeed: tituloEmailLabel)
        
        tituloLabelConfig(tituloLabelNeed: tituloNomeLabel)
        tituloLabelConfig(tituloLabelNeed: tituloUsernameLabel)
        tituloLabelConfig(tituloLabelNeed: emailLabel)
        
        usuarioImageImageView.image = UIImage(named: "user")




        
        
        
    }
    
    func labelConfig(labelNeed: UILabel){
        labelNeed.textColor = UIColor(red: 0.90, green: 0.34, blue: 0.34, alpha: 1.00)
        labelNeed.font = UIFont.boldSystemFont(ofSize: 20.0)
    }
    
    func tituloLabelConfig(tituloLabelNeed: UILabel){
        tituloLabelNeed.textColor = UIColor(red: 0.90, green: 0.34, blue: 0.34, alpha: 1.00)
        
    }
     
}
