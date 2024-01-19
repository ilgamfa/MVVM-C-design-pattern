//
//  MainTabBarCoordinator.swift
//  PatternCoordinator
//
//  Created by Ильгам Ахматдинов on 19.01.2024.
//

import UIKit

protocol MainTabBarCoordinatorDelegate: AnyObject {
    func didFinish()
}

final class MainTabBarCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    private let factory: MainTabBarFactory
    private weak var delegate: MainTabBarCoordinatorDelegate?
    var settingsCoordinator: BaseCoordinator?
    var newsCoordinator: BaseCoordinator?
    var discoveryCoordinator: BaseCoordinator?
    
    init(navigationController: UINavigationController, factory: MainTabBarFactory, delegate: MainTabBarCoordinatorDelegate) {
        self.navigationController = navigationController
        self.factory = factory
        self.delegate = delegate
    }
    
    func start() {
        let mainTabBarController = factory.makeTabBarController()
        
        settingsCoordinator = factory.makeSettingsCoordinator(delegate: self)
        newsCoordinator = factory.makeNewsCoordinator()
        discoveryCoordinator = factory.makeDiscoveryCoordinator()

        guard let settingsCoordinator,
              let newsCoordinator,
              let discoveryCoordinator
        else { return }
        
        mainTabBarController.viewControllers = [newsCoordinator.navigationController, discoveryCoordinator.navigationController , settingsCoordinator.navigationController]
        
        navigationController.pushViewController(mainTabBarController, animated: false)
        
        settingsCoordinator.start()
        newsCoordinator.start()
        discoveryCoordinator.start()
    }
}

extension MainTabBarCoordinator: SettingsCoordinatorDelegate {
    func didTapLogout() {
        delegate?.didFinish()
    }
}
