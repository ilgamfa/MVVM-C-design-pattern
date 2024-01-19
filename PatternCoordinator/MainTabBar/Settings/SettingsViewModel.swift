//
//  SettingsViewModel.swift
//  PatternCoordinator
//
//  Created by Ильгам Ахматдинов on 19.01.2024.
//

import Foundation

final class SettingsViewModel {
    var logoutAuth: LogoutAuth?
    
    init(logoutAuth: LogoutAuth?) {
        self.logoutAuth = logoutAuth
    }
    
    func logout() {
        logoutAuth?.logout()
    }
}
