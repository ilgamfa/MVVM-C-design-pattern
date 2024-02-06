//
//  CourtsViewController.swift
//  PatternCoordinator
//
//  Created by Ильгам Ахматдинов on 05.02.2024.
//

import UIKit

final class CourtsViewController: UIViewController {
    private let mapButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.setTitle("Map", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Courts"
        
        setupUI()
        configLoginButtonAction()
    }
    
    private func configLoginButtonAction() {
        let action = UIAction { [weak self] _ in
            let vc = CourtsMapViewController()
            vc.modalPresentationStyle = .fullScreen
            self?.navigationController?.present(vc, animated: true)
        }
        
        mapButton.addAction(action, for: .touchUpInside)
    }
    
    private func setupUI() {
        view.addSubview(mapButton)

        NSLayoutConstraint.activate([
            mapButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -40),
            mapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
