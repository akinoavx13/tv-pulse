//
//  WatchListScene.swift
//  TVPulse
//
//  Created by Maxime Maheo on 21/04/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI

struct WatchListScene: View {
    
    // MARK: - Properties
    
    @StateObject var viewModel: WatchListSceneViewModel
    
    // MARK: - Body
    
    var body: some View {
        Text("Watch list")
    }
}

#if DEBUG

struct WatchListScene_Previews: PreviewProvider {
    static var previews: some View {
        WatchListScene(viewModel: WatchListSceneViewModel.preview)
    }
}

#endif
