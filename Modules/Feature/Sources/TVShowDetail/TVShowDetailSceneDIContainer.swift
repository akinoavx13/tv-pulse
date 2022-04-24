//
//  TVShowDetailSceneDIContainer.swift
//  TVPulse
//
//  Created by Maxime Maheo on 22/04/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit.UINavigationController
import TMDB

public final class TVShowDetailSceneDIContainer {
    
    public struct Dependencies {

        // MARK: - Properties
        
        let tmdbService: TMDBServiceProtocol
        
        // MARK: - Lifecycle
        
        public init(tmdbService: TMDBServiceProtocol) {
            self.tmdbService = tmdbService
        }
    }
    
    // MARK: - Properties
    
    private let dependencies: Dependencies
    
    // MARK: - Lifecycle
    
    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Methods
    
    public func makeCoordinator(navigationController: UINavigationController) -> TVShowDetailSceneCoordinator {
        TVShowDetailSceneCoordinator(navigationController: navigationController,
                                     dependencies: self)
    }
}

// MARK: - TVShowDetailSceneCoordinatorDependencies -

extension TVShowDetailSceneDIContainer: TVShowDetailSceneCoordinatorDependencies {
    
    // MARK: - Properties
    
    public var tmdbService: TMDBServiceProtocol { dependencies.tmdbService }
    
}
