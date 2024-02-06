//
//  CourtsMapCoordinator.swift
//  PatternCoordinator
//
//  Created by Ильгам Ахматдинов on 05.02.2024.
//

import UIKit

final class CourtsMapCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    private var factory: CourtsMapFactory
    
    
    init(navigationController: UINavigationController, factory: CourtsMapFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() {
        let controller = factory.makeCourtsSheetController()
        navigationController.present(controller, animated: true)
    }
}

