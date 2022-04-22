//
//  DiscoverScene.swift
//  TVPulse
//
//  Created by Maxime Maheo on 21/04/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI
import Component

struct DiscoverScene: View {
    
    // MARK: - Properties
    
    @StateObject var viewModel: DiscoverSceneViewModel
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ScrollView(.horizontal,
                           showsIndicators: false) {
                    LazyHStack {
                        ForEach(viewModel.tvShows) { tvShow in
                            if viewModel.tvShows.first == tvShow {
                                PosterView(url: tvShow.wrappedPosterPathURL, width: 150)
                                    .padding(.leading, 8)
                            } else if viewModel.tvShows.last == tvShow {
                                PosterView(url: tvShow.wrappedPosterPathURL, width: 150)
                                    .padding(.trailing, 8)
                            } else {
                                PosterView(url: tvShow.wrappedPosterPathURL, width: 150)
                            }
                        }
                    }
                }
                .frame(height: 225)
            }
        }
    }
}

#if DEBUG

struct DiscoverScene_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverScene(viewModel: DiscoverSceneViewModel.preview)
    }
}

#endif
