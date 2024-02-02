//
//  NewsDetailCoordinator.swift
//  PatternCoordinator
//
//  Created by Ильгам Ахматдинов on 30.01.2024.
//

import UIKit

final class NewsDetailCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    private var factory: NewsDetailFactory
    
    
    init(navigationController: UINavigationController, factory: NewsDetailFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() {
        let controller = factory.makeNewsDetailController()
        controller.hidesBottomBarWhenPushed = true
        navigationController.pushViewController(controller, animated: true)
    }
}
