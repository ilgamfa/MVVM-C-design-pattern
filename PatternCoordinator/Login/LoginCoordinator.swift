//
//  LoginCoordinator.swift
//  PatternCoordinator
//
//  Created by Ильгам Ахматдинов on 19.01.2024.
//

import Foundation
import UIKit

protocol LoginCoordinatorDelegate: AnyObject {
    func didFinishLogin()
}

final class LoginCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    var loginFactory: LoginFactory
    
    weak var delegate: LoginCoordinatorDelegate?
    
    init(navigationController: UINavigationController, loginFactory: LoginFactory, delegate: LoginCoordinatorDelegate) {
        self.navigationController = navigationController
        self.loginFactory = loginFactory
        self.delegate = delegate
    }
    
    func start() {
        let controller = loginFactory.makeLoginViewController(coordinator: self)
        navigationController.pushViewController(controller, animated: true)
    }
}

extension LoginCoordinator: LoginViewControllerCoordinator {
    func didFinish() {
        delegate?.didFinishLogin()
    }
}
