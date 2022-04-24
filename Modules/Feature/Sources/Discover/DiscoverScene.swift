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
        Group {
            if viewModel.sections.isEmpty {
                ProgressView()
            } else {
                ScrollView(.vertical) {
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.sections) { section in
                            makeSectionView(title: section.title,
                                            tvShows: section.tvShows)
                        }
                    }
                }
            }
        }
        .alert(item: $viewModel.error) { error in
            Alert(title: Text(error.title),
                  message: Text(error.message),
                  dismissButton: .default(Text(error.dimissActionTitle)))
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
                        Button {
                            viewModel.pushTVShowDetails(tvShowId: tvShow.id)
                        } label: {
                            PosterView(url: tvShow.wrappedPosterPathURL, width: 125)
                                .padding(tvShows.first == tvShow ? .leading : .trailing,
                                         tvShows.first == tvShow || tvShows.last == tvShow ? 16 : 0)
                        }
                    }
                }
            }
        } header: {
            HStack {
                Text(title)
                    .font(.headline)
                    .padding(.leading)
                
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
