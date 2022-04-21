//
//  AppDIContainer.swift
//  TVPulse
//
//  Created by Maxime Maheo on 21/04/2022.
//

final class AppDIContainer {
    
    // MARK: - Services
    
    // MARK: - Containers
    
    private(set) lazy var watchListSceneDIContainer: WatchListSceneDIContainer = {
        let dependencies = WatchListSceneDIContainer.Dependencies()
        
        return WatchListSceneDIContainer(dependencies: dependencies)
    }()
}
