//
//  AppDIContainer.swift
//  TVPulse
//
//  Created by Maxime Maheo on 21/04/2022.
//

import TMDB
import WatchList
import Discover

final class AppDIContainer {
    
    // MARK: - Services
    
    private(set) lazy var tmdbService: TMDBServiceProtocol = {
        TMDBService()
    }()
    
    // MARK: - Containers
    
    private(set) lazy var watchListSceneDIContainer: WatchListSceneDIContainer = {
        let dependencies = WatchListSceneDIContainer.Dependencies()
        
        return WatchListSceneDIContainer(dependencies: dependencies)
    }()
    
    private(set) lazy var discoverSceneDIContainer: DiscoverSceneDIContainer = {
        let dependencies = DiscoverSceneDIContainer.Dependencies(tmdbService: tmdbService)
        
        return DiscoverSceneDIContainer(dependencies: dependencies)
    }()
}
