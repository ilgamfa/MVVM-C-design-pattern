//
//  CourtsSheetCoordinator.swift
//  PatternCoordinator
//
//  Created by Ильгам Ахматдинов on 05.02.2024.
//

import UIKit

final class CourtsSheetCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    private var factory: CourtsSheetFactory
    
    
    init(navigationController: UINavigationController, factory: CourtsSheetFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() {
        let controller = factory.makeCourtsSheetController()
        navigationController.present(controller, animated: true)
    }
}

