//
//  NewsFactory.swift
//  PatternCoordinator
//
//  Created by Ильгам Ахматдинов on 19.01.2024.
//

import UIKit

struct NewsFactory {
    func makeNewsController(coordinatorDelegate: NewsDetailViewControllerCoordinatorDelegate) -> UIViewController {
        let controller = NewsViewController(coordinatorDelegate: coordinatorDelegate)
        return controller
    }
    
    func makeItemTabBar(navigation: UINavigationController) {
        let tabBarItem = UITabBarItem(title: "News", image: UIImage(systemName: "newspaper"), selectedImage: UIImage(systemName: "newspaper.fill"))
        navigation.tabBarItem = tabBarItem
    }
    
    func makeNewsDetailCoordinator(navigationController: UINavigationController) -> BaseCoordinator {
        let factory = NewsDetailFactory()
        let coordinator = NewsDetailCoordinator(navigationController: navigationController, factory: factory)
        return coordinator
    }
}
