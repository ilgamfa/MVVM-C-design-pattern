//
//  SettingsFactory.swift
//  PatternCoordinator
//
//  Created by Ильгам Ахматдинов on 19.01.2024.
//

import UIKit

struct SettingsFactory {
    let appDIContainer: AppDIContainer?
    
    func makeSettingsController(coordinator: SettingsViewControllerCoordinator) -> UIViewController {
        let viewModel = SettingsViewModel(logoutAuth: appDIContainer?.auth)
        let controller = SettingsViewController(coordinator: coordinator, viewModel: viewModel)
        return controller
    }
    
    func makeItemTabBar(navigation: UINavigationController) {
        let tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape.2"), selectedImage: UIImage(systemName: "gearshape.2.fill"))
        navigation.tabBarItem = tabBarItem
    }
}
