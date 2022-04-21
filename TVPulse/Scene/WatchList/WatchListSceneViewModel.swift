//
//  WatchListSceneViewModel.swift
//  TVPulse
//
//  Created by Maxime Maheo on 21/04/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Combine

final class WatchListSceneViewModel: ObservableObject {
    
    // MARK: - Properties
    
    weak var coordinator: WatchListSceneCoordinator?
}

#if DEBUG

extension WatchListSceneViewModel {
    static let preview = WatchListSceneViewModel()
}

#endif
