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
    let viewModel: HomeViewModel
   
   enum Route: String {
       case historic
       case filter
   }
   
   public init(router: HomeRouter, viewModel: HomeViewModel) {
       self.router = router
       self.viewModel = viewModel
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
       searchButton.tintColor = UIColor(red: 1.00, green: 0.95, blue: 0.74, alpha: 1.00)
       searchButton.backgroundColor = UIColor(red: 0.89, green: 0.24, blue: 0.25, alpha: 0.80)
       searchButton.layer.cornerRadius = 25.0
       nameLabel.textColor = UIColor(red: 0.88, green: 0.22, blue: 0.33, alpha: 1.00)
       logoutButton.tintColor = UIColor(red: 0.88, green: 0.22, blue: 0.33, alpha: 1.00)
       historicButton.tintColor = UIColor(red: 0.88, green: 0.22, blue: 0.33, alpha: 1.00)
       profileImage.image = UIImage(named: "userLogo")
       profileImage.layer.cornerRadius = 55
       profileImage.layer.borderColor = UIColor(red: 0.88, green: 0.22, blue: 0.33, alpha: 1.00).cgColor
       profileImage.layer.borderWidth = 2
   }
   
   func setup() {
       if let url = URL(string: viewModel.profile.last ?? "") {
           if url != URL(string: "") {
               downloadFromUrl(from: url) { data, _, error in
                   guard let data = data, error == nil else { return }
                   DispatchQueue.main.async { [unowned self] in
                       profileImage.image = UIImage(data: data) ?? UIImage()
                   }
               }
           }
       }
       nameLabel.text = viewModel.profile.first ?? ""
   }
    
    func downloadFromUrl(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    
    @IBAction func logoutButtonAction(_ sender: Any) {
        self.router.popBack(from: self)
    }
    
    @IBAction func historicButtonAction(_ sender: Any) {
        self.router.route(to: Route.historic.rawValue, from: self, parameters: nil)
    }
    
    @IBAction func searchButtonAction(_ sender: Any) {
        self.router.route(to: Route.filter.rawValue, from: self, parameters: nil)
    }
    
}
