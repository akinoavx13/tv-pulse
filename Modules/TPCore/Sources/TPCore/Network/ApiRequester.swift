//
//  ApiRequester.swift
//  
//
//  Created by Maxime Maheo on 22/04/2022.
//

import Foundation

public final class ApiRequester {
    
    // MARK: - Properties
    
    private let decoder: JSONDecoder
    private let urlSession: URLSession
    
    // MARK: - Lifecycle
    
    public init(urlSession: URLSession = .shared) {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        self.decoder = decoder
        self.urlSession = urlSession
    }
    
    // MARK: - Methods
    
    public func fetch<T: Codable>(endpoint: Endpoint,
                                  params: [Param]? = nil) async throws -> T {
        var request = buildRequest(endpoint: endpoint,
                                   params: params)
        request.httpMethod = "GET"
        
        let (data, _) = try await urlSession.data(for: request, delegate: nil)
        return try decoder.decode(T.self, from: data)
    }
    
    // MARK: - Properties
    
    private func buildRequest(endpoint: Endpoint,
                              params: [Param]?) -> URLRequest {
        let url = endpoint.build()
        
        guard var components = URLComponents(url: url,
                                             resolvingAgainstBaseURL: true) else { fatalError() }
        components.queryItems = []
        
        if let params = params {
            components
                .queryItems?
                .append(contentsOf: params.map { $0.build() })
        }
        
        guard let componentUrl = components.url else { fatalError() }
        
        return URLRequest(url: componentUrl)
    }
}
