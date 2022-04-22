//
//  PosterView.swift
//  
//
//  Created by Maxime Maheo on 22/04/2022.
//

import SwiftUI
import Kingfisher
import Foundation.NSURL

public struct PosterView: View {
    
    // MARK: - Properties
    
    let url: URL?
    let width: CGFloat
    
    // MARK: - Lifecycle
    
    public init(url: URL?,
                width: CGFloat) {
        self.url = url
        self.width = width
    }
    
    // MARK: - Body
    
    public var body: some View {
        ZStack {
            if let url = url {
                KFImage(url)
                    .placeholder({ makePlaceholderView() })
                    .setProcessors([DownsamplingImageProcessor(size: CGSize(width: width * UIScreen.main.scale,
                                                                            height: width * 1.5 * UIScreen.main.scale)),
                                    RoundCornerImageProcessor(cornerRadius: 8)])
                    .fade(duration: 0.2)
                    .resizable()
            } else {
                makePlaceholderView()
            }
        }
        .frame(width: width,
               height: width * 1.5)
    }
    
    // MARK: - Methods
    
    private func makePlaceholderView() -> some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.primary.opacity(0.1))
    }
}

#if DEBUG

struct PosterView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PosterView(url: URL(string: "https://image.tmdb.org/t/p/w500/nJUHX3XL1jMkk8honUZnUmudFb9.jpg"),
                       width: 150)
            
            PosterView(url: nil,
                       width: 150)
        }
        .previewLayout(.fixed(width: 200, height: 200 * 1.5))
        
    }
}

#endif
