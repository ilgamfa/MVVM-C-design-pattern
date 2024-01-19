//
//  NewsFactory.swift
//  PatternCoordinator
//
//  Created by Ильгам Ахматдинов on 19.01.2024.
//

import UIKit

struct NewsFactory {
    func makeNewsController() -> UIViewController {
        let controller = NewsViewController()
        return controller
    }
    
    func makeItemTabBar(navigation: UINavigationController) {
        let tabBarItem = UITabBarItem(title: "News", image: UIImage(systemName: "newspaper"), selectedImage: UIImage(systemName: "newspaper.fill"))
        navigation.tabBarItem = tabBarItem
    }
}
