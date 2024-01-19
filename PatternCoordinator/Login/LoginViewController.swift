//
//  LoginViewController.swift
//  PatternCoordinator
//
//  Created by Ильгам Ахматдинов on 19.01.2024.
//

import UIKit

protocol LoginViewControllerCoordinator: AnyObject {
    func didFinish()
}

final class LoginViewController: UIViewController {
    
    private weak var coordinator: LoginViewControllerCoordinator?
    private let viewModel: LoginViewModel?
    
    private let loginbutton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        
        var config = UIButton.Configuration.filled()
        button.configuration = config
        
        return button
    }()
    
    init(coordinator: LoginViewControllerCoordinator?, viewModel: LoginViewModel?) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            self?.viewModel?.login()
            self?.coordinator?.didFinish()
        }
        
        loginbutton.addAction(action, for: .touchUpInside)
    }
}
