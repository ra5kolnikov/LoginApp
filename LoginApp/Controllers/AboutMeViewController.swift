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

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.gray.cgColor, UIColor.white.cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        guard let  name = user.name else { return }
        guard let  surname = user.surname else { return }
        navigationItem.title = name + " " + surname
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
