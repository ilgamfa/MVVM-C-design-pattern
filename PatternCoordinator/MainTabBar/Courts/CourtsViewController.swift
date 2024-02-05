//
//  CourtsViewController.swift
//  PatternCoordinator
//
//  Created by Ильгам Ахматдинов on 05.02.2024.
//

import UIKit
import MapKit

final class CourtsViewController: UIViewController {
    lazy var mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Courts"
        
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(mapView)

        mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
