//
//  AboutMeViewController.swift
//  LoginApp
//
//  Created by Виталий Усольцев on 07.06.2022.
//

import UIKit

class AboutMeViewController: UIViewController {

    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: Add Gradient for View Background
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.gray.cgColor, UIColor.white.cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        guard let  name = user.name else { return }
        guard let  surname = user.surname else { return }
        navigationItem.title = name + " " + surname
    }
}
