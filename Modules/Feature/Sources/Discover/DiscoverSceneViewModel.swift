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
import Core

@MainActor
final class DiscoverSceneViewModel: ObservableObject {
    
    struct Section: Identifiable {
        let id = UUID()
        let title: String
        let tvShows: [TVShow]
    }
    
    // MARK: - Properties
    
    @Published private(set) var sections: [Section] = []
    @Published var error: AppError?

    weak var coordinator: DiscoverSceneCoordinator?
    
    private let tmdbService: TMDBServiceProtocol
    
    // MARK: - Lifecycle
    
    init(tmdbService: TMDBServiceProtocol) {
        self.tmdbService = tmdbService
        
        Task {
            await fetchData()
        }
    }
    
    // MARK: - Methods
    
    func pushTVShowDetails(tvShowId: Int) {
        coordinator?.pushTVShowDetails(tvShowId: tvShowId)
    }
    
    // MARK: - Private methods
    
    // swiftlint:disable:next function_body_length
    private func fetchData() async {
        async let popularTVShows = tmdbService.fetchPopularTVShow()
        async let topRatedTVShows = tmdbService.fetchTopRatedTVShow()
        async let airingTodayTVShows = tmdbService.fetchAiringTodayTVShows()
        async let onTheAirTVShows = tmdbService.fetchOnTheAirTVShows()
        async let actionAndAdventureTVShows = tmdbService.fetchDiscoverTVShow(genres: [.actionAndAdventure])
        async let animationTVShows = tmdbService.fetchDiscoverTVShow(genres: [.animation])
        async let comedyTVShows = tmdbService.fetchDiscoverTVShow(genres: [.comedy])
        async let crimeTVShows = tmdbService.fetchDiscoverTVShow(genres: [.crime])
        async let documentaryTVShows = tmdbService.fetchDiscoverTVShow(genres: [.documentary])
        async let dramaTVShows = tmdbService.fetchDiscoverTVShow(genres: [.drama])
        async let familyTVShows = tmdbService.fetchDiscoverTVShow(genres: [.family])
        async let kidsTVShows = tmdbService.fetchDiscoverTVShow(genres: [.kids])
        async let mysteryTVShows = tmdbService.fetchDiscoverTVShow(genres: [.mystery])
        async let newsTVShows = tmdbService.fetchDiscoverTVShow(genres: [.news])
        async let realityTVShows = tmdbService.fetchDiscoverTVShow(genres: [.reality])
        async let scienceFictionTVShows = tmdbService.fetchDiscoverTVShow(genres: [.scienceFiction])
        async let soapTVShows = tmdbService.fetchDiscoverTVShow(genres: [.soap])
        async let talkTVShows = tmdbService.fetchDiscoverTVShow(genres: [.talk])
        async let warAndPoliticsTVShows = tmdbService.fetchDiscoverTVShow(genres: [.warAndPolitics])
        async let westernTVShows = tmdbService.fetchDiscoverTVShow(genres: [.western])
    
        do {
            sections = try await [.init(title: "§Popular", tvShows: popularTVShows),
                                  .init(title: "§Top rated", tvShows: topRatedTVShows),
                                  .init(title: "§Airing today", tvShows: airingTodayTVShows),
                                  .init(title: "§On the air", tvShows: onTheAirTVShows),
                                  .init(title: "§Action & Adventure", tvShows: actionAndAdventureTVShows),
                                  .init(title: "§Science Fiction", tvShows: scienceFictionTVShows),
                                  .init(title: "§Crime", tvShows: crimeTVShows),
                                  .init(title: "§Drama", tvShows: dramaTVShows),
                                  .init(title: "§Comedy", tvShows: comedyTVShows),
                                  .init(title: "§Reality", tvShows: realityTVShows),
                                  .init(title: "§Western", tvShows: westernTVShows),
                                  .init(title: "§War & Politics", tvShows: warAndPoliticsTVShows),
                                  .init(title: "§Kids", tvShows: kidsTVShows),
                                  .init(title: "§Family", tvShows: familyTVShows),
                                  .init(title: "§Animation", tvShows: animationTVShows),
                                  .init(title: "§Documentary", tvShows: documentaryTVShows),
                                  .init(title: "§News", tvShows: newsTVShows),
                                  .init(title: "§Mystery", tvShows: mysteryTVShows),
                                  .init(title: "§Soap", tvShows: soapTVShows),
                                  .init(title: "§Talk", tvShows: talkTVShows)]
        } catch {
            self.error = AppError(error: error)
        }
    }
}

#if DEBUG

extension DiscoverSceneViewModel {
    static let preview = DiscoverSceneViewModel(tmdbService: TMDBService())
}

#endif
