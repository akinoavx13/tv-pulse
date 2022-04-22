//
//  TMDBService.swift
//  
//
//  Created by Maxime Maheo on 22/04/2022.
//

import Model
import Core

public protocol TMDBServiceProtocol {
    
    func fetchDiscoverTVShow() async throws -> [TVShow]
    
}

public final class TMDBService: TMDBServiceProtocol {

    // MARK: - Properties
    
    private var apiRequester: ApiRequester
    
    // MARK: - Lifecycle
    
    public init(apiRequester: ApiRequester = ApiRequester()) {
        self.apiRequester = apiRequester
    }
    
    // MARK: - Methods
    
    public func fetchDiscoverTVShow() async throws -> [TVShow] {
        let response: PaginatedResponse<TVShow> = try await apiRequester.fetch(endpoint: TMDBEndpoint.dicoverTV,
                                                                               params: [TMDBParam.apiKey])
        
        return response.results
    }
}
