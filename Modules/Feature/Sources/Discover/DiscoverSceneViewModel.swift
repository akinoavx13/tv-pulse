//
//  DiscoverSceneViewModel.swift
//  TVPulse
//
//  Created by Maxime Maheo on 21/04/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Combine
import TMDB
import Model

@MainActor
final class DiscoverSceneViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published private(set) var tvShows: [TVShow] = []
    
    weak var coordinator: DiscoverSceneCoordinator?
    
    private let tmdbService: TMDBServiceProtocol
    
    // MARK: - Lifecycle
    
    init(tmdbService: TMDBServiceProtocol) {
        self.tmdbService = tmdbService
        
        Task {
            await fetchDiscover()
        }
    }
    
    // MARK: - Private methods
    
    private func fetchDiscover() async {
        do {
            tvShows = try await tmdbService.fetchDiscoverTVShow()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}

#if DEBUG

extension DiscoverSceneViewModel {
    static let preview = DiscoverSceneViewModel(tmdbService: TMDBService())
}

#endif
