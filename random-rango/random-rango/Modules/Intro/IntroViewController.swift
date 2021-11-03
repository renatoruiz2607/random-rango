//
//  IntroViewController.swift
//  random-rango
//
//  Created by Renato on 20/10/21.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var introBackgroundView: UIView!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var circuloLayer: UIImageView!
    
    var backgroundImage = UIImageView()
    
    let router: IntroRouter
    
    enum Route: String {
        case skip
    }
    
    public init(router: IntroRouter) {
        self.router = router
        super.init(nibName: "IntroViewController", bundle: Bundle(for: IntroViewController.self))
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        view.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
        introBackgroundView.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
        
        backgroundImage.removeFromSuperview()
        backgroundImage = UIImageView(frame: introBackgroundView.bounds)
        backgroundImage.image = UIImage(named: "imageBackground")
        backgroundImage.contentMode =  UIView.ContentMode.scaleToFill
        introBackgroundView.layer.masksToBounds = true
        introBackgroundView.addSubview(backgroundImage)
        introBackgroundView.sendSubviewToBack(backgroundImage)
       
        
        skipButton.layer.cornerRadius = 15.0
        skipButton.layer.borderWidth = 1
        skipButton.layer.borderColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00).cgColor
        skipButton.clipsToBounds = true
        skipButton.layer.borderColor = UIColor.clear.cgColor
        skipButton.backgroundColor = UIColor(red: 0.89, green: 0.24, blue: 0.25, alpha: 0.80)
        skipButton.tintColor = UIColor(red: 1.00, green: 0.95, blue: 0.74, alpha: 1.00)
        
        circuloLayer.layer.cornerRadius = 124.0
        circuloLayer.layer.borderWidth = 0.5
        circuloLayer.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.89, alpha: 1.00)
        circuloLayer.layer.borderColor = UIColor.clear.cgColor
        
        
    }
    
    @IBAction func skipButtonAction(_ sender: Any) {
        self.router.route(to: Route.skip.rawValue, from: self, parameters: nil)
    }
    
}
