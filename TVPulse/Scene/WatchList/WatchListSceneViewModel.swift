//
//  WatchListSceneViewModel.swift
//  TVPulse
//
//  Created by Maxime Maheo on 21/04/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Combine
import TPCore
import TPService

final class WatchListSceneViewModel: ObservableObject {
    
    // MARK: - Properties
    
    weak var coordinator: WatchListSceneCoordinator?
    
    private let tmdbService: TMDBServiceProtocol
    
    // MARK: - Lifecycle
    
    init(tmdbService: TMDBServiceProtocol) {
        self.tmdbService = tmdbService
        
        Task {
            do {
                let tvShow = try await tmdbService.fetchDiscoverTVShow()
                
                print(tvShow)
            } catch {
                print(error)
            }
        }
    }
}

#if DEBUG

extension WatchListSceneViewModel {
    static let preview = WatchListSceneViewModel(tmdbService: TMDBService())
}

#endif
