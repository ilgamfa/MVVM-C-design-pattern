//
//  LoginViewModel.swift
//  PatternCoordinator
//
//  Created by Ильгам Ахматдинов on 19.01.2024.
//

import Foundation

final class LoginViewModel {
    var loginAuth: LoginAuth?
    
    init(loginAuth: LoginAuth?) {
        self.loginAuth = loginAuth
    }
    
    func login() {
        loginAuth?.login()
    }
}
