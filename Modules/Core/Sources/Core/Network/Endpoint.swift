//
//  Endpoint.swift
//  
//
//  Created by Maxime Maheo on 22/04/2022.
//

import Foundation.NSURL

public protocol Endpoint {
    
    // MARK: - Methods
    
    func build() -> URL
    
}
