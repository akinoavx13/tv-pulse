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
    public let status: String?
    public let genres: [Genre]?
    public let firstAirDate: String?
    public let episodeRunTime: [Int]?
    public let voteAverage: Double?
    public let numberOfSeasons: Int?
    public let overview: String?
    public let networks: [Network]?
    
    public var wrappedPosterPathURL: URL? {
        guard let posterPath = posterPath else { return nil }
        
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
    }
}

// MARK: - Genre -

extension TVShow {
    public struct Genre: Codable, Identifiable, Equatable {
        
        // MARK: - Properties
        
        public let id: Int
        public let name: String
    }
}

// MARK: - Network -

extension TVShow {
    public struct Network: Codable, Identifiable, Equatable {
        
        // MARK: - Properties
        
        public let id: Int
        public let name: String
        public let logoPath: String?
        
        public var wrappedLogoPathURL: URL? {
            guard let logoPath = logoPath else { return nil }
            
            return URL(string: "https://image.tmdb.org/t/p/w500\(logoPath)")
        }
    }
}
