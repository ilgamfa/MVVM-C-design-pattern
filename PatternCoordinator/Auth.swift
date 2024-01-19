//
//  Auth.swift
//  PatternCoordinator
//
//  Created by Ильгам Ахматдинов on 19.01.2024.
//

import Foundation

protocol SessionCheckerAuth {
    var isSessionActive: Bool { get }
}

protocol LoginAuth {
    func login()
}

protocol LogoutAuth {
    func logout()
}

final class Auth {
    private var session = false
}

extension Auth: SessionCheckerAuth {
    var isSessionActive: Bool { session }
}

extension Auth: LoginAuth, LogoutAuth {
    func login() {
        session = true
    }
    
    func logout() {
        session = false
    }
}
