//
//  DiscoveryCoordinator.swift
//  PatternCoordinator
//
//  Created by Ильгам Ахматдинов on 19.01.2024.
//

import UIKit

final class DiscoveryCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    private var factory: DiscoveryFactory
    
    init(navigationController: UINavigationController, factory: DiscoveryFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() {
        let controller = factory.makeDiscoveryController()
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.pushViewController(controller, animated: true)
        factory.makeItemTabBar(navigation: navigationController)
    }
}
