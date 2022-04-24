//
//  TMDBService.swift
//  
//
//  Created by Maxime Maheo on 22/04/2022.
//

import Model
import Networking

public protocol TMDBServiceProtocol {
    func fetchPopularTVShow() async throws -> [TVShow]
    func fetchTopRatedTVShow() async throws -> [TVShow]
    func fetchDiscoverTVShow(genres: [TMDBParam.Genres]) async throws -> [TVShow]
    func fetchAiringTodayTVShows() async throws -> [TVShow]
    func fetchOnTheAirTVShows() async throws -> [TVShow]
    func fetchTVShowDetails(tvShowId: Int) async throws -> TVShow
}

public final class TMDBService: TMDBServiceProtocol {

    // MARK: - Properties
    
    private var apiRequester: ApiRequester
    
    // MARK: - Lifecycle
    
    public init(apiRequester: ApiRequester = ApiRequester()) {
        self.apiRequester = apiRequester
    }
    
    // MARK: - Methods
    
    public func fetchPopularTVShow() async throws -> [TVShow] {
        let response: PaginatedResponse<TVShow> = try await apiRequester.fetch(endpoint: TMDBEndpoint.popularTVShows,
                                                                               params: [TMDBParam.apiKey,
                                                                                        TMDBParam.language])
        
        return response.results
    }
    
    public func fetchTopRatedTVShow() async throws -> [TVShow] {
        let response: PaginatedResponse<TVShow> = try await apiRequester.fetch(endpoint: TMDBEndpoint.topRatedTVShows,
                                                                               params: [TMDBParam.apiKey,
                                                                                        TMDBParam.language])
        
        return response.results
    }
    
    public func fetchDiscoverTVShow(genres: [TMDBParam.Genres]) async throws -> [TVShow] {
        var params = [TMDBParam.apiKey,
                      TMDBParam.language]
        
        if !genres.isEmpty {
            params.append(TMDBParam.genres(values: genres))
        }
        
        let response: PaginatedResponse<TVShow> = try await apiRequester.fetch(endpoint: TMDBEndpoint.discoverTVShows,
                                                                               params: params)
        
        return response.results
    }
    
    public func fetchAiringTodayTVShows() async throws -> [TVShow] {
        let response: PaginatedResponse<TVShow> = try await apiRequester.fetch(endpoint: TMDBEndpoint.airingTodayTVShows,
                                                                               params: [TMDBParam.apiKey,
                                                                                        TMDBParam.language])
        
        return response.results
    }
    
    public func fetchOnTheAirTVShows() async throws -> [TVShow] {
        let response: PaginatedResponse<TVShow> = try await apiRequester.fetch(endpoint: TMDBEndpoint.onTheAirTVShows,
                                                                               params: [TMDBParam.apiKey,
                                                                                        TMDBParam.language])
        
        return response.results
    }
    
    public func fetchTVShowDetails(tvShowId: Int) async throws -> TVShow {
        try await apiRequester.fetch(endpoint: TMDBEndpoint.tvShowDetails(tvShowId: tvShowId),
                                     params: [TMDBParam.apiKey,
                                              TMDBParam.language])
    }
}
