//
//  DiscoverSceneCoordinator.swift
//  TVPulse
//
//  Created by Maxime Maheo on 21/04/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit.UINavigationController
import SwiftUI
import TPCore

protocol DiscoverSceneCoordinatorDependencies: AnyObject { }

final class DiscoverSceneCoordinator: CoordinatorProtocol {
    
    // MARK: - Properties
    
    var parentCoordinator: CoordinatorProtocol?
    var children: [CoordinatorProtocol] = []
    
    private let navigationController: UINavigationController
    private let dependencies: DiscoverSceneCoordinatorDependencies

    // MARK: - Lifecycle
    
    init(navigationController: UINavigationController,
         dependencies: DiscoverSceneCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    // MARK: - Methods
    
    func start() {
        let viewModel = DiscoverSceneViewModel()
        viewModel.coordinator = self
        
        let viewController = UIHostingController(rootView: DiscoverScene(viewModel: viewModel))
        
        navigationController.setViewControllers([viewController],
                                                animated: false)
    }
    
    func stop() { fatalError("Should not be stopped.") }
}
