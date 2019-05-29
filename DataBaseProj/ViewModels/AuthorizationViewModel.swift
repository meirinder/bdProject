//
//  AuthorizationViewModel.swift
//  DataBaseProj
//
//  Created by Savely on 05/05/2019.
//  Copyright © 2019 Sibers. All rights reserved.
//

import UIKit

class AuthorizationViewModel {
    private var dataBaseWorker = DataBaseWorker()
    weak var delegate: AlertDelegate?

    func logIn(login:String, password: String) -> (Bool,Int?) {
        return dataBaseWorker.logIn(login: login, password: password) 
    }
    
}
