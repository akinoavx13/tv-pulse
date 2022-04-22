//
//  DiscoverScene.swift
//  TVPulse
//
//  Created by Maxime Maheo on 21/04/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI
import Component
import Model

struct DiscoverScene: View {
    
    // MARK: - Properties
    
    @StateObject var viewModel: DiscoverSceneViewModel
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(viewModel.sections) { section in
                    makeSectionView(title: section.title,
                                    tvShows: section.tvShows)
                }
            }
        }
    }
    
    // MARK: - Private methods
    
    private func makeSectionView(title: String,
                                 tvShows: [TVShow]) -> some View {
        Section {
            ScrollView(.horizontal,
                       showsIndicators: false) {
                LazyHStack {
                    ForEach(tvShows) { tvShow in
                        if tvShows.first == tvShow {
                            PosterView(url: tvShow.wrappedPosterPathURL, width: 150)
                                .padding(.leading, 8)
                        } else if tvShows.last == tvShow {
                            PosterView(url: tvShow.wrappedPosterPathURL, width: 150)
                                .padding(.trailing, 8)
                        } else {
                            PosterView(url: tvShow.wrappedPosterPathURL, width: 150)
                        }
                    }
                }
            }
        } header: {
            HStack {
                Text(title)
                    .font(.headline)
                    .padding(.leading, 8)
                
                Spacer()
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
