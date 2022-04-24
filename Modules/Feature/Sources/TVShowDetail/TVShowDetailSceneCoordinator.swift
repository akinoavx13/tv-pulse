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
import TMDB

public protocol TVShowDetailSceneCoordinatorDependencies: AnyObject {
    
    // MARK: - Properties
    
    var tmdbService: TMDBServiceProtocol { get }
    
}

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
    
    @MainActor
    public func start(params: Any...) {
        guard let tvShowId = params.first as? Int else { fatalError("Could not find tvShowId Param") }
        
        let viewModel = TVShowDetailSceneViewModel(tmdbService: dependencies.tmdbService,
                                                   tvShowId: tvShowId)
        viewModel.coordinator = self
        
        let viewController = UIHostingController(rootView: TVShowDetailScene(viewModel: viewModel))

        navigationController.pushViewController(viewController, animated: true)
    }
    
    public func stop() { fatalError("Should not be stopped.") }
}
