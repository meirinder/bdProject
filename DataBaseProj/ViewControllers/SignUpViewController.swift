//
//  SignUpViewController.swift
//  DataBaseProj
//
//  Created by Savely on 05/05/2019.
//  Copyright © 2019 Sibers. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var viewModel: SignUpViewModel? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func signUpAction(_ sender: Any) {
        viewModel?.signUp(login: loginTextField.text ?? "", password: passwordTextField.text ??
            "" , confirm: confirmPasswordTextField.text ?? "")
    }
    

}

extension SignUpViewController: AlertDelegate, ReturnDelegate {
    func showAlert(text: String, title: String) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
        })
        alert.addAction(ok)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
    
    func returnView() {
        self.dismiss(animated: true, completion: nil)
    }
}

protocol ReturnDelegate: class {
    func returnView()
}

protocol AlertDelegate: class {
    func showAlert(text: String, title: String)
}
