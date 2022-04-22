//
//  NWPaginatedResponse.swift
//  
//
//  Created by Maxime Maheo on 22/04/2022.
//

public struct NWPaginatedResponse<T: Codable>: Codable {
    
    // MARK: - Properties
    
    public let page: Int
    public let results: [T]
}
