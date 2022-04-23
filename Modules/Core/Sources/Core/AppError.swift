//
//  AppError.swift
//  
//
//  Created by Maxime Maheo on 23/04/2022.
//

import Foundation.NSUUID

public struct AppError: Identifiable {
    
    // MARK: - Properties
    
    public let id = UUID()
    public let title: String
    public let message: String
    public let dimissActionTitle: String
    
    // MARK: - Lifecycle
    
    public init(error: Error) {
        title = "§Error occurred"
        message = "§Something went wrong"
        dimissActionTitle = "§Got it!"
    }
}
