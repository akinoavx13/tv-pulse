//
//  TVShowDetailScene.swift
//  TVPulse
//
//  Created by Maxime Maheo on 22/04/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI
import Component
import Kingfisher
import Model

struct TVShowDetailScene: View {
    
    // MARK: - Properties
    
    @StateObject var viewModel: TVShowDetailSceneViewModel
    
    // MARK: - Body
    
    var body: some View {
        Group {
            if let tvShow = viewModel.tvShow {
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        makeHeaderView(tvShow: tvShow)
                        
                        Divider()
                        
                        if let overview = tvShow.overview,
                           !overview.isEmpty {
                            makeSynopsisView(overview: overview)
                        }
                    }
                    .padding()
                }
            } else {
                ProgressView()
            }
        }
        .alert(item: $viewModel.error) { error in
            Alert(title: Text(error.title),
                  message: Text(error.message),
                  dismissButton: .default(Text(error.dimissActionTitle)))
        }
    }
    
    // MARK: - Private methods
    
    private func makeHeaderView(tvShow: TVShow) -> some View {
        HStack {
            PosterView(url: tvShow.wrappedPosterPathURL,
                       width: 100)
            
            VStack(alignment: .leading,
                   spacing: 12) {
                HStack {
                    Text(tvShow.name)
                        .font(.title)
                        .bold()
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                    
                    tvShow.firstAirDate.map {
                        Text("(\(String($0.prefix(4))))")
                            .opacity(0.6)
                    }
                }
                
                tvShow.genres.map { genres in
                    Text(genres.map { $0.name }.joined(separator: ", "))
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                }
                
                HStack {
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        
                        Text("\(tvShow.voteAverage ?? 0, specifier: "%.1f")")
                    }
                    
                    Text("•")
                    
                    Text("\(tvShow.numberOfSeasons ?? 0) §Season.s")
                        .lineLimit(1)
                    
                    Text("•")
                    
                    Text("\(tvShow.episodeRunTime?.first ?? 0) min")
                        .lineLimit(1)
                }
            }
        }
    }
    
    private func makeSynopsisView(overview: String) -> some View {
        VStack(alignment: .leading,
               spacing: 12) {
            Text("§Synopsis")
                .font(.headline)
            
            Text(overview)
            
            Divider()
        }
    }
}

#if DEBUG

struct TVShowDetailScene_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TVShowDetailScene(viewModel: TVShowDetailSceneViewModel.preview)
            
            TVShowDetailScene(viewModel: TVShowDetailSceneViewModel.preview)
                .preferredColorScheme(.dark)
        }
    }
}

#endif
