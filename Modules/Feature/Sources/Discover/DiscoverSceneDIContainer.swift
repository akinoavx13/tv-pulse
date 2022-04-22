//
//  DiscoverSceneDIContainer.swift
//  TVPulse
//
//  Created by Maxime Maheo on 21/04/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit.UINavigationController

public final class DiscoverSceneDIContainer {
    
    public struct Dependencies {
        
        // MARK: - Lifecycle
        
        public init() { }
    }
    
    // MARK: - Properties
    
    private let dependencies: Dependencies
    
    // MARK: - Lifecycle
    
    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Methods
    
    public func makeCoordinator(navigationController: UINavigationController) -> DiscoverSceneCoordinator {
        DiscoverSceneCoordinator(navigationController: navigationController,
                                 dependencies: self)
    }
}

// MARK: - DiscoverSceneCoordinatorDependencies -

extension DiscoverSceneDIContainer: DiscoverSceneCoordinatorDependencies { }
