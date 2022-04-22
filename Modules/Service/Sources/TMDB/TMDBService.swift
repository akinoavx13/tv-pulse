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
}
