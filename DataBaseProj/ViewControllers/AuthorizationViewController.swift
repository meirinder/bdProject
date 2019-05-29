//
//  ViewController.swift
//  DataBaseProj
//
//  Created by Savely on 05/05/2019.
//  Copyright © 2019 Sibers. All rights reserved.
//

import UIKit

class AuthorizationViewController: UIViewController {

    var viewModel = AuthorizationViewModel()
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         viewModel.delegate = self
          
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SignUpSegue" {
            let vc = segue.destination as! SignUpViewController
            vc.viewModel = SignUpViewModel()
        }
    }

    @IBAction func loginAction(_ sender: Any) {
        let log = viewModel.logIn(login: loginTextField.text ?? "", password: passwordTextField.text ?? "")
        if !log.0 {
            showAlert(text: "Wrong name or password", title: "Error")
        } else {
            showAlert(text: "You are successfully log in", title: "Success")
            IdCash.default.value = log.1!
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "TabBarContr") as! UITabBarController
            self.navigationController?.showDetailViewController(vc, sender: self) 
        }
    }
    
}

extension AuthorizationViewController: AlertDelegate {
    func showAlert(text: String, title: String) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
        })
        alert.addAction(ok)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
}

