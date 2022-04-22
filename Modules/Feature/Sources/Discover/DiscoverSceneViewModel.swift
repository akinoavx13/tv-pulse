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
import Foundation.NSUUID

@MainActor
final class DiscoverSceneViewModel: ObservableObject {
    
    struct Section: Identifiable {
        let id = UUID()
        let title: String
        let tvShows: [TVShow]
    }
    
    // MARK: - Properties
    
    @Published private(set) var sections: [Section] = []
    @Published var error: Error?

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
        async let popularTVShows: [TVShow] = tmdbService.fetchPopularTVShow()
        async let topRatedTVShows: [TVShow] = tmdbService.fetchTopRatedTVShow()
        
        do {
            sections = try await [.init(title: "§Popular", tvShows: popularTVShows),
                                  .init(title: "§Top rated", tvShows: topRatedTVShows)]
        } catch {
            self.error = error
        }
    }
}

#if DEBUG

extension DiscoverSceneViewModel {
    static let preview = DiscoverSceneViewModel(tmdbService: TMDBService())
}

#endif
