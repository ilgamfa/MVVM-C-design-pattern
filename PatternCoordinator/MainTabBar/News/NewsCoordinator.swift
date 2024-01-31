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
    private var newsDetailCoordinator: BaseCoordinator?
    
    init(navigationController: UINavigationController, factory: NewsFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() {
        let controller = factory.makeNewsController(coordinatorDelegate: self)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.pushViewController(controller, animated: true)
        factory.makeItemTabBar(navigation: navigationController)
    }
    
    func startNewsDetailCoordinator() {
        newsDetailCoordinator = factory.makeNewsDetailCoordinator(navigationController: navigationController)
        guard let newsDetailCoordinator else { return }
        newsDetailCoordinator.start()
    }
}

extension NewsCoordinator: NewsDetailViewControllerCoordinatorDelegate {
    func startNewsDetailViewController() {
        startNewsDetailCoordinator()
    }
}
