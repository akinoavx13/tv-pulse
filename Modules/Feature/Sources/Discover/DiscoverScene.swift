//
//  DiscoverScene.swift
//  TVPulse
//
//  Created by Maxime Maheo on 21/04/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI

struct DiscoverScene: View {
    
    // MARK: - Properties
    
    @StateObject var viewModel: DiscoverSceneViewModel
    
    // MARK: - Body
    
    var body: some View {
        Text("Discover")
    }
}

#if DEBUG

struct DiscoverScene_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverScene(viewModel: DiscoverSceneViewModel.preview)
    }
}

#endif
