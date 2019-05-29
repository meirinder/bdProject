//
//  SignUpViewModel.swift
//  DataBaseProj
//
//  Created by Savely on 05/05/2019.
//  Copyright © 2019 Sibers. All rights reserved.
//

import UIKit

class SignUpViewModel: NSObject {

    private var dataBaseWorker = DataBaseWorker()
    weak var delegate: (AlertDelegate & ReturnDelegate)?

    
    func signUp(login: String, password: String, confirm: String) {
        if login.count < 5 {
            delegate?.showAlert(text: "Too short login, must be more than 5 characters", title: "Error")
            return
        }
        if password.count < 5 {
            delegate?.showAlert(text: "Too short password, must be more than 5 characters", title: "Error")
            return
        }
        if password != confirm {
            delegate?.showAlert(text: "Passwords do not match", title: "Error")
            return
        }
        dataBaseWorker.signUp(login: login, password: password)
        delegate?.showAlert(text: "You are successfully sign up", title: "Success")
        delegate?.returnView()
    }
}
