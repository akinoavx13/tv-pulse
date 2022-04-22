//
//  TMDBParam.swift
//  
//
//  Created by Maxime Maheo on 22/04/2022.
//

import Core
import Foundation.NSURL

enum TMDBParam: Param {
    case apiKey
    
    public func build() -> URLQueryItem {
        switch self {
        case .apiKey: return URLQueryItem(name: "api_key", value: "cf99dc7a02cdd3548dfb58dc60cfc3c2")
        }
    }
}
