//
//  TMDBEndpoint.swift
//  
//
//  Created by Maxime Maheo on 22/04/2022.
//

import Networking
import Foundation.NSURL

enum TMDBEndpoint: Endpoint {
    case popularTVShows
    case topRatedTVShows
    case discoverTVShows
    case airingTodayTVShows
    case onTheAirTVShows
    case tvShowDetails(tvShowId: Int)
    
    public func build() -> URL {
        guard let baseURL = URL(string: "https://api.themoviedb.org/3") else { fatalError() }
        
        switch self {
        case .popularTVShows: return baseURL.appendingPathComponent("tv/popular")
        case .topRatedTVShows: return baseURL.appendingPathComponent("tv/top_rated")
        case .discoverTVShows: return baseURL.appendingPathComponent("discover/tv")
        case .airingTodayTVShows: return baseURL.appendingPathComponent("tv/airing_today")
        case .onTheAirTVShows: return baseURL.appendingPathComponent("tv/on_the_air")
        case let .tvShowDetails(tvShowId): return baseURL.appendingPathComponent("tv/\(tvShowId)")
        }
    }
}
