//
//  MainTabBarFactory.swift
//  PatternCoordinator
//
//  Created by Ильгам Ахматдинов on 19.01.2024.
//

import UIKit

struct MainTabBarFactory {
    let appDIContainer: AppDIContainer?
    
    func makeTabBarController() -> UITabBarController {
        let mainTabBarController = MainTabBarController()
        return mainTabBarController
    }
    
    func makeSettingsCoordinator(delegate: SettingsCoordinatorDelegate) -> BaseCoordinator {
        let factory = SettingsFactory(appDIContainer: appDIContainer)
        let navigation = UINavigationController()
        
        return SettingsCoordinator(navigationController: navigation, factory: factory, delegate: delegate)
    }
    
    func makeNewsCoordinator() -> BaseCoordinator {
        let factory = NewsFactory()
        let navigation = UINavigationController()
        
        return NewsCoordinator(navigationController: navigation, factory: factory)
    }
    
    func makeDiscoveryCoordinator() -> BaseCoordinator {
        let factory = DiscoveryFactory()
        let navigation = UINavigationController()
        
        return DiscoveryCoordinator(navigationController: navigation, factory: factory)
    }
    
    func makeCourtsCoordinator() -> BaseCoordinator {
        let factory = CourtsFactory()
        let navigation = UINavigationController()
        
        return CourtsCoordinator(navigationController: navigation, factory: factory)
    }
}
