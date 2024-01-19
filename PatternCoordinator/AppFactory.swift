//
//  AppFactory.swift
//  PatternCoordinator
//
//  Created by Ильгам Ахматдинов on 19.01.2024.
//

import Foundation
import UIKit

struct AppFactory {
    let appDIContainer: AppDIContainer?
    
    func makeLoginCoordinator(navigationController: UINavigationController, delegate: LoginCoordinatorDelegate) -> BaseCoordinator {
        let loginFactory = LoginFactory(appDIContainer: appDIContainer)
        let coordinator = LoginCoordinator(
            navigationController: navigationController,
            loginFactory: loginFactory,
            delegate: delegate
        )
        
        return coordinator
    }
    
    func makeMainTabBarCoordinator(navigationController: UINavigationController, delegate: MainTabBarCoordinatorDelegate) -> BaseCoordinator {
        let mainFactory = MainTabBarFactory(appDIContainer: appDIContainer)
        return MainTabBarCoordinator(
            navigationController: navigationController,
            factory: mainFactory,
            delegate: delegate
        )
    }
}
