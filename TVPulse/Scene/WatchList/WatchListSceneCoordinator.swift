//
//  WatchListSceneCoordinator.swift
//  TVPulse
//
//  Created by Maxime Maheo on 21/04/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit.UINavigationController
import SwiftUI
import TPCore

protocol WatchListSceneCoordinatorDependencies: AnyObject { }

final class WatchListSceneCoordinator: CoordinatorProtocol {
    
    // MARK: - Properties
    
    var parentCoordinator: CoordinatorProtocol?
    var children: [CoordinatorProtocol] = []
    
    private let navigationController: UINavigationController
    private let dependencies: WatchListSceneCoordinatorDependencies

    // MARK: - Lifecycle
    
    init(navigationController: UINavigationController,
         dependencies: WatchListSceneCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    // MARK: - Methods
    
    func start() {
        let viewModel = WatchListSceneViewModel()
        viewModel.coordinator = self
        
        let viewController = UIHostingController(rootView: WatchListScene(viewModel: viewModel))
        
        navigationController.setViewControllers([viewController],
                                                animated: false)
    }
    
    func stop() { fatalError("Should not be stopped.") }
}
