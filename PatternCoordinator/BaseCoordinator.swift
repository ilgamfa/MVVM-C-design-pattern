//
//  BaseCoordinator.swift
//  PatternCoordinator
//
//  Created by Ильгам Ахматдинов on 19.01.2024.
//

import Foundation
import UIKit

protocol BaseCoordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    
    func start()
}
