//
//  DiscoverSceneDIContainer.swift
//  TVPulse
//
//  Created by Maxime Maheo on 21/04/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit.UINavigationController
import TMDB
import TVShowDetail

public final class DiscoverSceneDIContainer {
    
    public struct Dependencies {
        
        // MARK: - Properties
        
        let tmdbService: TMDBServiceProtocol
        let tvShowDetailDIContainer: TVShowDetailSceneDIContainer
        
        // MARK: - Lifecycle
        
        public init(tmdbService: TMDBServiceProtocol,
                    tvShowDetailDIContainer: TVShowDetailSceneDIContainer) {
            self.tmdbService = tmdbService
            self.tvShowDetailDIContainer = tvShowDetailDIContainer
        }
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

extension DiscoverSceneDIContainer: DiscoverSceneCoordinatorDependencies {
    
    // MARK: - Properties
    
    public var tmdbService: TMDBServiceProtocol { dependencies.tmdbService }
    public var tvShowDetailDIContainer: TVShowDetailSceneDIContainer { dependencies.tvShowDetailDIContainer }
}
