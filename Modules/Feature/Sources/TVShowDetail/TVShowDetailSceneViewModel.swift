//
//  TVShowDetailSceneViewModel.swift
//  TVPulse
//
//  Created by Maxime Maheo on 22/04/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Combine
import TMDB
import Model
import Core

@MainActor
final class TVShowDetailSceneViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published private(set) var tvShow: TVShow?
    @Published var error: AppError?

    weak var coordinator: TVShowDetailSceneCoordinator?
    
    private let tmdbService: TMDBServiceProtocol
    
    // MARK: - Lifecycle
    
    init(tmdbService: TMDBServiceProtocol,
         tvShowId: Int) {
        self.tmdbService = tmdbService
        
        Task {
            await fetchData(tvShowId: tvShowId)
        }
    }
    
    // MARK: - Private methods
    
    private func fetchData(tvShowId: Int) async {
        do {
            tvShow = try await tmdbService.fetchTVShowDetails(tvShowId: tvShowId)
        } catch {
            self.error = AppError(error: error)
        }
    }
    
}

#if DEBUG

extension TVShowDetailSceneViewModel {
    static let preview = TVShowDetailSceneViewModel(tmdbService: TMDBService(),
                                                    tvShowId: 92749)
}

#endif
