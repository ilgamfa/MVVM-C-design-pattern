//
//  SettingsCoordinator.swift
//  PatternCoordinator
//
//  Created by Ильгам Ахматдинов on 19.01.2024.
//

import UIKit

protocol SettingsCoordinatorDelegate: AnyObject {
    func didTapLogout()
}

final class SettingsCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    private var factory: SettingsFactory
    private weak var delegate: SettingsCoordinatorDelegate?
    
    init(navigationController: UINavigationController, factory: SettingsFactory, delegate: SettingsCoordinatorDelegate?) {
        self.navigationController = navigationController
        self.factory = factory
        self.delegate = delegate
    }
    
    func start() {
        let controller = factory.makeSettingsController(coordinator: self)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.pushViewController(controller, animated: true)
        factory.makeItemTabBar(navigation: navigationController)
    }
}

extension SettingsCoordinator: SettingsViewControllerCoordinator {
    func logoutButtonTapped() {
        delegate?.didTapLogout()
    }
}
