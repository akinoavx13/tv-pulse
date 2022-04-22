//
//  AppDIContainer.swift
//  TVPulse
//
//  Created by Maxime Maheo on 21/04/2022.
//

import Service
import WatchList
import Discover

final class AppDIContainer {
    
    // MARK: - Services
    
    private(set) lazy var tmdbService: TMDBServiceProtocol = {
        TMDBService()
    }()
    
    // MARK: - Containers
    
    private(set) lazy var watchListSceneDIContainer: WatchListSceneDIContainer = {
        let dependencies = WatchListSceneDIContainer.Dependencies(tmdbService: tmdbService)
        
        return WatchListSceneDIContainer(dependencies: dependencies)
    }()
    
    private(set) lazy var discoverSceneDIContainer: DiscoverSceneDIContainer = {
        let dependencies = DiscoverSceneDIContainer.Dependencies()
        
        return DiscoverSceneDIContainer(dependencies: dependencies)
    }()
}
