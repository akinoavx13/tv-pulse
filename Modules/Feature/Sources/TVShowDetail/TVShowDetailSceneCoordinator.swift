//
//  TVShowDetailSceneCoordinator.swift
//  TVPulse
//
//  Created by Maxime Maheo on 22/04/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit.UINavigationController
import SwiftUI
import Core

public protocol TVShowDetailSceneCoordinatorDependencies: AnyObject { }

public final class TVShowDetailSceneCoordinator: CoordinatorProtocol {
    
    // MARK: - Properties
    
    public var parentCoordinator: CoordinatorProtocol?
    public var children: [CoordinatorProtocol] = []
    
    private let navigationController: UINavigationController
    private let dependencies: TVShowDetailSceneCoordinatorDependencies

    // MARK: - Lifecycle
    
    public init(navigationController: UINavigationController,
                dependencies: TVShowDetailSceneCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    // MARK: - Methods
    
    public func start() {
        let viewModel = TVShowDetailSceneViewModel()
        viewModel.coordinator = self
        
        let viewController = UIHostingController(rootView: TVShowDetailScene(viewModel: viewModel))
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    public func stop() { fatalError("Should not be stopped.") }
}
