//
//  TMDBEndpoint.swift
//  
//
//  Created by Maxime Maheo on 22/04/2022.
//

import Networking
import Foundation.NSURL

enum TMDBEndpoint: String, Endpoint {
    case popularTVShows = "tv/popular"
    case topRatedTVShows = "tv/top_rated"
    case discoverTVShows = "discover/tv"
    
    public func build() -> URL {
        guard let baseURL = URL(string: "https://api.themoviedb.org/3") else { fatalError() }
        
        return baseURL.appendingPathComponent(self.rawValue)
    }
}
