//
//  ViewController.swift
//  LoginApp
//
//  Created by Виталий Усольцев on 07.06.2022.
//

import UIKit

class LoginViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    var user = User(login: "Vit", password: "123", name: "Vitaliy", surname: "Usoltsev")
    
    override func viewDidLoad() {
        super.viewDidLoad()
                loginTF.delegate = self
                passwordTF.delegate = self
    }
    //MARK: Actions
    @IBAction func logInPressed() {
        guard
            loginTF.text == user.login,
            passwordTF.text == user.password
        else {
            showAlert(title: "Invalid Login or Password",
                      message: "Please, enter correct login and password",
                      textField: passwordTF)
            return
        }
        performSegue(withIdentifier: "login", sender: nil)
    }
}
    //MARK: Extension Add Alert + Unwind Segue
extension LoginViewController {
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = nil
        }
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        loginTF.text = nil
        passwordTF.text = nil
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarVC = segue.destination as! UITabBarController
        let welcomeVC = tabBarVC.viewControllers?.first as! WelcomeViewController
        let navigationVC = tabBarVC.viewControllers?.last as! UINavigationController
        let aboutMeVC = navigationVC.topViewController as! AboutMeViewController
        welcomeVC.user.name = user.name
        aboutMeVC.user.name = user.name
        aboutMeVC.user.surname = user.surname
    }
}
    //MARK: Text Field Delegate
extension LoginViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTF {
            passwordTF.becomeFirstResponder()
        } else {
            logInPressed()
        }
        return true
    }
}

