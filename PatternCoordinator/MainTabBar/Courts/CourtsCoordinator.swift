//
//  CourtsCoordinator.swift
//  PatternCoordinator
//
//  Created by Ильгам Ахматдинов on 05.02.2024.
//

import UIKit

final class CourtsCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    private var factory: CourtsFactory
    
    init(navigationController: UINavigationController, factory: CourtsFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() {
        let controller = factory.makeCourtsViewController()
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.pushViewController(controller, animated: true)
        factory.makeItemTabBar(navigation: navigationController)
    }
}
