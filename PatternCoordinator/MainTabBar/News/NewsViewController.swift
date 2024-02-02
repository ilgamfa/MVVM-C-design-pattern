//
//  NewsViewController.swift
//  PatternCoordinator
//
//  Created by Ильгам Ахматдинов on 19.01.2024.
//

import UIKit

protocol NewsDetailViewControllerCoordinatorDelegate: AnyObject {
    func startNewsDetailViewController()
}

final class NewsViewController: UIViewController {
    
    private weak var coordinatorDelegate: NewsDetailViewControllerCoordinatorDelegate?
    
    private let newsDetailButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("News details", for: .normal)
        
        var config = UIButton.Configuration.filled()
        button.configuration = config
        
        return button
    }()
    
    init(coordinatorDelegate: NewsDetailViewControllerCoordinatorDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.coordinatorDelegate = coordinatorDelegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        
        setupUI()
        configLoginButtonAction()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(newsDetailButton)
        
        newsDetailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        newsDetailButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func configLoginButtonAction() {
        let action = UIAction { [weak self] _ in
            self?.coordinatorDelegate?.startNewsDetailViewController()
        }
        
        newsDetailButton.addAction(action, for: .touchUpInside)
    }
}
