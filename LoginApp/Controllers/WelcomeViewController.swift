//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Виталий Усольцев on 07.06.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: Add Gradient for View Background
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.purple.cgColor, UIColor.white.cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        guard let name = user.name else { return }
        welcomeLabel.text = "Welcome \(name)"
    }
}
