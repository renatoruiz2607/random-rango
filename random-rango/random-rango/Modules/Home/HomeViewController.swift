//
//  HomeViewController.swift
//  random-rango
//
//  Created by Renato on 17/10/21.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {

   @IBOutlet weak var logoImage: UIImageView!
   @IBOutlet weak var profileImage: UIImageView!
   @IBOutlet weak var nameLabel: UILabel!
   @IBOutlet weak var logoutButton: UIButton!
   @IBOutlet weak var historicButton: UIButton!
   @IBOutlet weak var searchButton: UIButton!
   
   private let disposeBag = DisposeBag()
   
   let router: HomeRouter
   
   enum Route: String {
       case login
       case forgotPass
       case signUp
       case sugestion
   }
   
   public init(router: HomeRouter) {
       self.router = router
       super.init(nibName: "HomeViewController", bundle: Bundle(for: HomeViewController.self))
   }
   
   required init?(coder: NSCoder) {
       return nil
   }
   
   override func viewDidLoad() {
       super.viewDidLoad()
       setupUI()
       setup()
   }
   
   func setupUI(){
       view.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
       logoImage.image = UIImage(named: "appLogo")
       searchButton.tintColor = UIColor(red: 1.00, green: 0.95, blue: 0.74, alpha: 1.00)
       searchButton.backgroundColor = UIColor(red: 0.88, green: 0.22, blue: 0.33, alpha: 1.00)
       searchButton.layer.cornerRadius = 25.0
       nameLabel.textColor = UIColor(red: 0.88, green: 0.22, blue: 0.33, alpha: 1.00)
       logoutButton.tintColor = UIColor(red: 0.88, green: 0.22, blue: 0.33, alpha: 1.00)
       historicButton.tintColor = UIColor(red: 0.88, green: 0.22, blue: 0.33, alpha: 1.00)
       profileImage.layer.cornerRadius = 55
       profileImage.layer.borderColor = UIColor(red: 0.88, green: 0.22, blue: 0.33, alpha: 1.00).cgColor
       profileImage.layer.borderWidth = 2
       
   }
   
   func setup() {

   }
    
    
    @IBAction func logoutButtonAction(_ sender: Any) {

        
    }
    
    @IBAction func historicButtonAction(_ sender: Any) {
        
    }
    
    @IBAction func searchButtonAction(_ sender: Any) {
        
    }
    
}
