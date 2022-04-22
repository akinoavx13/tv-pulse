//
//  TMDBParam.swift
//  
//
//  Created by Maxime Maheo on 22/04/2022.
//

import Networking
import Foundation.NSURL

public enum TMDBParam: Param {
    case apiKey
    case language
    case genres(values: [Genres])
    
    public func build() -> URLQueryItem {
        switch self {
        case .apiKey: return URLQueryItem(name: "api_key", value: "cf99dc7a02cdd3548dfb58dc60cfc3c2")
        case .language: return URLQueryItem(name: "language", value: Locale.preferredLanguages[0])
        case let .genres(values): return URLQueryItem(name: "with_genres", value: values.map { $0.rawValue }.joined(separator: ","))
        }
    }
}

public extension TMDBParam {
    enum Genres: String {
        case actionAndAdventure = "10759"
        case animation = "16"
        case comedy = "35"
        case crime = "80"
        case documentary = "99"
        case drama = "18"
        case family = "10751"
        case kids = "10762"
        case mystery = "9648"
        case news = "10763"
        case reality = "10764"
        case scienceFiction = "10765"
        case soap = "10766"
        case talk = "10767"
        case warAndPolitics = "10768"
        case western = "37"
    }
}
