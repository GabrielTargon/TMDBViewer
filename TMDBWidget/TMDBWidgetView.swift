//
//  TMDBWidgetView.swift
//  TMDBWidgetExtension
//
//  Created by Gabriel Targon on 15/12/22.
//

import SwiftUI

struct TMDBWidgetView: View {
    var title: String
    var imageURL: URL
    
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
        }
        .background(
            AsyncImage(url: imageURL)
                .scaledToFill()
        )
    }
}

struct TMDBWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        TMDBWidgetView(title: "TMDBView",
                       imageURL: URL(string: "")!)
    }
}
