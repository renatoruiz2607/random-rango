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
        backgroundImage.removeFromSuperview()
        backgroundImage = UIImageView(frame: introBackgroundView.bounds)
        backgroundImage.image = UIImage(named: "introBackground")
        backgroundImage.contentMode =  UIView.ContentMode.scaleToFill
        introBackgroundView.layer.masksToBounds = true
        introBackgroundView.addSubview(backgroundImage)
        introBackgroundView.sendSubviewToBack(backgroundImage)
    }
    
    @IBAction func skipButtonAction(_ sender: Any) {
        self.router.route(to: Route.skip.rawValue, from: self, parameters: nil)
    }
    
}
