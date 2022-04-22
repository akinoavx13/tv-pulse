//
//  DiscoverSceneViewModel.swift
//  TVPulse
//
//  Created by Maxime Maheo on 21/04/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Combine

@MainActor
final class DiscoverSceneViewModel: ObservableObject {
    
    // MARK: - Properties
    
    weak var coordinator: DiscoverSceneCoordinator?
}

#if DEBUG

extension DiscoverSceneViewModel {
    static let preview = DiscoverSceneViewModel()
}

#endif
