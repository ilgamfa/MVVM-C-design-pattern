//
//  SettingsViewController.swift
//  PatternCoordinator
//
//  Created by Ильгам Ахматдинов on 19.01.2024.
//

import UIKit

protocol SettingsViewControllerCoordinator: AnyObject {
    func logoutButtonTapped()
}

final class SettingsViewController: UIViewController {
    
    private weak var coordinator: SettingsViewControllerCoordinator?
    private let viewModel: SettingsViewModel?
    
    private let loginbutton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logout", for: .normal)
        
        var config = UIButton.Configuration.filled()
        button.configuration = config
        
        return button
    }()
    
    init(coordinator: SettingsViewControllerCoordinator?, viewModel: SettingsViewModel?) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        
        setupUI()
        configLoginButtonAction()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(loginbutton)
        
        loginbutton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginbutton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func configLoginButtonAction() {
        let action = UIAction { [weak self] _ in
            self?.viewModel?.logout()
            self?.coordinator?.logoutButtonTapped()
        }
        
        loginbutton.addAction(action, for: .touchUpInside)
    }
}
