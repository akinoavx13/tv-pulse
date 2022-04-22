//
//  TVShow.swift
//  
//
//  Created by Maxime Maheo on 22/04/2022.
//

import Foundation.NSURL

public struct TVShow: Codable, Identifiable, Equatable {
    
    // MARK: - Properties
    
    public let id: Int
    public let name: String
    public let posterPath: String?
    
    public var wrappedPosterPathURL: URL? {
        guard let posterPath = posterPath else { return nil }
        
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
    }
}
