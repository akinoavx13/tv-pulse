//
//  TVShowDetailScene.swift
//  TVPulse
//
//  Created by Maxime Maheo on 22/04/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI
import Component

struct TVShowDetailScene: View {
    
    // MARK: - Properties
    
    @StateObject var viewModel: TVShowDetailSceneViewModel
    
    // MARK: - Body
    
    var body: some View {
        Group {
            if let tvShow = viewModel.tvShow {
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        HStack {
                            PosterView(url: tvShow.wrappedPosterPathURL,
                                       width: 100)
                            
                            VStack(alignment: .leading,
                                   spacing: 12) {
                                HStack {
                                    Text(tvShow.name)
                                        .font(.title)
                                        .bold()
                                    
                                    tvShow.firstAirDate.map {
                                        Text("(\(String($0.prefix(4))))")
                                            .opacity(0.6)
                                    }
                                }
                                
                                tvShow.genres.map { genres in
                                    Text(genres.map { $0.name }.joined(separator: ", "))
                                }
                                
                                HStack {
                                    HStack(spacing: 4) {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.yellow)
                                        
                                        tvShow.voteAverage.map {
                                            Text("\($0, specifier: "%.1f")")
                                        }
                                    }
                                    
                                    Text("•")
                                    
                                    tvShow.numberOfSeasons.map {
                                        Text("\($0) §Season")
                                    }
                                    
                                    Text("•")
                                    
                                    tvShow.episodeRunTime?.first.map {
                                        Text("\($0) min")
                                    }
                                }
                            }
                        }
                        
                        Divider()
                        
                        tvShow.overview.map {
                            Text($0)
                        }
                    }
                    .padding(.horizontal)
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
