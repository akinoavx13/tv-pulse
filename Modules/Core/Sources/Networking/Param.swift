//
//  Param.swift
//  
//
//  Created by Maxime Maheo on 22/04/2022.
//

import Foundation.NSURL

public protocol Param {
    
    // MARK: - Methods
    
    func build() -> URLQueryItem
    
}
