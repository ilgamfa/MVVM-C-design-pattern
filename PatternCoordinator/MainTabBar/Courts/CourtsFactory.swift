//
//  CourtsFactory.swift
//  PatternCoordinator
//
//  Created by Ильгам Ахматдинов on 05.02.2024.
//

import UIKit

struct CourtsFactory {
    func makeCourtsViewController() -> UIViewController {
        CourtsViewController()
    }
    
    func makeItemTabBar(navigation: UINavigationController) {
        navigation.tabBarItem = UITabBarItem(
            title: "Courts",
            image: UIImage(systemName: "sportscourt"),
            selectedImage: UIImage(systemName: "sportscourt.fill")
        )
    }
}
