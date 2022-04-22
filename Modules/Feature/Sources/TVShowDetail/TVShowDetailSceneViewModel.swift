//
//  TVShowDetailSceneViewModel.swift
//  TVPulse
//
//  Created by Maxime Maheo on 22/04/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Combine

final class TVShowDetailSceneViewModel: ObservableObject {
    
    // MARK: - Properties
    
    weak var coordinator: TVShowDetailSceneCoordinator?
}

#if DEBUG

extension TVShowDetailSceneViewModel {
    static let preview = TVShowDetailSceneViewModel()
}

#endif
