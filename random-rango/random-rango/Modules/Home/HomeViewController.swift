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
    @IBOutlet weak var separatorLabel: UILabel!
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var socialMediaFirstImage: UIImageView!
    @IBOutlet weak var socialMediaSecondImage: UIImageView!
    
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
        homeTableView.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
        separatorLabel.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
        logoImage.image = UIImage(named: "appLogo")
        socialMediaFirstImage.image = UIImage(named: "googleLogoG")
        socialMediaSecondImage.image = UIImage(named: "facebookLogo")
    }
    
    func setup() {
        homeTableView.register(UINib(nibName: "TextFieldCell", bundle: Bundle(for: TextFieldCell.self)), forCellReuseIdentifier: "TextFieldCell")
        homeTableView.register(UINib(nibName: "ButtonCell", bundle: Bundle(for: ButtonCell.self)), forCellReuseIdentifier: "ButtonCell")
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return HomeSectionModel.totalSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case HomeSectionModel.inputEmail.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as? TextFieldCell else { return UITableViewCell() }
            cell.setup(placeholder: "Email")
            return cell
        case HomeSectionModel.inputPassword.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as? TextFieldCell else { return UITableViewCell() }
            cell.setup(placeholder: "Senha")
            return cell
        case HomeSectionModel.forgotPass.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath) as? ButtonCell else { return UITableViewCell() }
            cell.setup(title: "Esqueceu a senha?", hasBackground: false)
            
            cell.genericButton.rx.tap
                .bind { [unowned self] in
                    self.router.route(to: Route.forgotPass.rawValue, from: self, parameters: nil)
                }
                .disposed(by: self.disposeBag)
            
            return cell
        case HomeSectionModel.login.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath) as? ButtonCell else { return UITableViewCell() }
            cell.setup(title: "Entrar", hasBackground: true)
            
            cell.genericButton.rx.tap
                .bind { [unowned self] in
                    self.router.route(to: Route.login.rawValue, from: self, parameters: nil)
                }
                .disposed(by: self.disposeBag)
            
            return cell
        case HomeSectionModel.signUp.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath) as? ButtonCell else { return UITableViewCell() }
            cell.setup(title: "Crie seu cadastro", hasBackground: false)
            
            cell.genericButton.rx.tap
                .bind { [unowned self] in
                    self.router.route(to: Route.signUp.rawValue, from: self, parameters: nil)
                }
                .disposed(by: self.disposeBag)
            
            return cell
        case HomeSectionModel.sugestion.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath) as? ButtonCell else { return UITableViewCell() }
            cell.setup(title: "Tela de sugestão", hasBackground: false)
            
            cell.genericButton.rx.tap
                .bind { [unowned self] in
                    self.router.route(to: Route.sugestion.rawValue, from: self, parameters: nil)
                }
                .disposed(by: self.disposeBag)
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
}
