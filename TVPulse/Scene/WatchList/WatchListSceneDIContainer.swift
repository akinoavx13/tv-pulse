//
//  WatchListSceneDIContainer.swift
//  TVPulse
//
//  Created by Maxime Maheo on 21/04/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit.UINavigationController

final class WatchListSceneDIContainer {
    
    struct Dependencies { }
    
    // MARK: - Properties
    
    private let dependencies: Dependencies
    
    // MARK: - Lifecycle
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Methods
    
    func makeCoordinator(navigationController: UINavigationController) -> WatchListSceneCoordinator {
        WatchListSceneCoordinator(navigationController: navigationController,
                                  dependencies: self)
    }
}

// MARK: - WatchListSceneCoordinatorDependencies -

extension WatchListSceneDIContainer: WatchListSceneCoordinatorDependencies { }
