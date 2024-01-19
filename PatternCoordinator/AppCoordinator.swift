//
//  AppCoordinator.swift
//  PatternCoordinator
//
//  Created by Ильгам Ахматдинов on 19.01.2024.
//

import Foundation
import UIKit

class AppCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    var window: UIWindow?
    var appFactory: AppFactory?
    var auth: SessionCheckerAuth?

    private var loginCoordinator: BaseCoordinator?
    private var mainTabBarCoordinator: BaseCoordinator?

    init(navigationController: UINavigationController, window: UIWindow?, appFactory: AppFactory?, auth: Auth?) {
        self.navigationController = navigationController
        self.window = window
        self.appFactory = appFactory
        self.auth = auth
    }

    func start() {
        configWindow()
        startSomeCoordinator()
    }
    
    private func configWindow() {
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    private func startSomeCoordinator() {
        guard let auth else { return }
        if auth.isSessionActive {
            startMainTabBarCoordinator()
        } else {
            startLoginCoordinator()
        }
    }
    
    private func startLoginCoordinator() {
        loginCoordinator = appFactory?.makeLoginCoordinator(
            navigationController: navigationController,
            delegate: self
        )

        loginCoordinator?.start()
    }
    
    private func startMainTabBarCoordinator() {
        mainTabBarCoordinator = appFactory?.makeMainTabBarCoordinator(navigationController: navigationController, delegate: self)
        mainTabBarCoordinator?.start()
    }
}

extension AppCoordinator: LoginCoordinatorDelegate {
    func didFinishLogin() {
        navigationController.viewControllers = []
        loginCoordinator = nil
        startSomeCoordinator()
    }
}

extension AppCoordinator: MainTabBarCoordinatorDelegate {
    func didFinish() {
        navigationController.viewControllers = []
        mainTabBarCoordinator = nil
        startSomeCoordinator()
    }
}
