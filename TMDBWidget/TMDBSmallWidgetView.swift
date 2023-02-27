//
//  TMDBSmallWidgetView.swift
//  TMDBWidgetExtension
//
//  Created by Gabriel Targon on 15/12/22.
//

import SwiftUI
import WidgetKit

struct TMDBSmallWidgetView: View {
    var title: String
    var imageURL: URL?
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.clear, .black],
                           startPoint: .center,
                           endPoint: .bottom)
            VStack {
                Text(title)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .bottomLeading)
            .padding(.leading, 10)
            .padding(.bottom, 10)
            
            AsyncImage(url: imageURL) { image in
                image
                    .scaledToFit()
            } placeholder: {
                Image("TMDB-logo")
                    .resizable()
                    .frame(width: 100,
                           height: 70)
            }
        }
        .background(
            Color.tmdbAlmostBlack
        )
    }
}

struct TMDBSmallWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        TMDBSmallWidgetView(title: "TMDB",
                            imageURL: nil)
        .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
