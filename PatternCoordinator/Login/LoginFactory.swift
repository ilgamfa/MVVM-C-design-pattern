//
//  LoginFactory.swift
//  PatternCoordinator
//
//  Created by Ильгам Ахматдинов on 19.01.2024.
//

import Foundation
import UIKit

struct LoginFactory {
    let appDIContainer: AppDIContainer?
    
    func makeLoginViewController(coordinator: LoginViewControllerCoordinator) -> UIViewController {
        LoginViewController(coordinator: coordinator, viewModel: LoginViewModel(loginAuth: appDIContainer?.auth))
    }
}
