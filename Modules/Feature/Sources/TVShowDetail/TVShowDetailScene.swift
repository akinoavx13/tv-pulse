//
//  TVShowDetailScene.swift
//  TVPulse
//
//  Created by Maxime Maheo on 22/04/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI

struct TVShowDetailScene: View {
    
    // MARK: - Properties
    
    @StateObject var viewModel: TVShowDetailSceneViewModel
    
    // MARK: - Body
    
    var body: some View {
        Text("Hello, World")
    }
}

#if DEBUG

struct TVShowDetailScene_Previews: PreviewProvider {
    static var previews: some View {
        TVShowDetailScene(viewModel: TVShowDetailSceneViewModel.preview)
    }
}

#endif
