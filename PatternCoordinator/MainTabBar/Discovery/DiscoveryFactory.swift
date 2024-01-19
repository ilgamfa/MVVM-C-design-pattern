//
//  DiscoveryFactory.swift
//  PatternCoordinator
//
//  Created by Ильгам Ахматдинов on 19.01.2024.
//

import UIKit

struct DiscoveryFactory {
    func makeDiscoveryController() -> UIViewController {
        let controller = DiscoveryViewController()
        return controller
    }
    
    func makeItemTabBar(navigation: UINavigationController) {
        let tabBarItem = UITabBarItem(title: "Discovery", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass.circle.fill"))
        navigation.tabBarItem = tabBarItem
    }

}
