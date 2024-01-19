//
//  NewsCoordinator.swift
//  PatternCoordinator
//
//  Created by Ильгам Ахматдинов on 19.01.2024.
//

import UIKit

final class NewsCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    private var factory: NewsFactory
    
    init(navigationController: UINavigationController, factory: NewsFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() {
        let controller = factory.makeNewsController()
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.pushViewController(controller, animated: true)
        factory.makeItemTabBar(navigation: navigationController)
    }

}
