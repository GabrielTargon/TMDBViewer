//
//  TMDBWidget.swift
//  TMDBWidget
//
//  Created by Gabriel Targon on 24/10/22.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(title: "TMDB",
                    imageURL: nil)
    }

    func getSnapshot(in context: Context,
                     completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(title: "TMDB",
                                imageURL: nil)
        completion(entry)
    }

    func getTimeline(in context: Context,
                     completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        NetworkWidgetService().fetchMoviesList { timelineEntry in
            completion(timelineEntry)
        }
    }
}

struct SimpleEntry: TimelineEntry {
    var date = Date()
    let title: String
    let imageURL: URL?
}

struct TMDBWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        TMDBSmallWidgetView(title: entry.title,
                            imageURL: entry.imageURL)
    }
}

@main
struct TMDBWidget: Widget {
    let kind: String = "TMDBWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            TMDBWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("TMDBWidget")
        .description("Here you can see the most rated movie")
        .supportedFamilies([.systemSmall])
    }
}

struct TMDBWidget_Previews: PreviewProvider {
    static var previews: some View {
        TMDBWidgetEntryView(entry: SimpleEntry(title: "TMDB",
                                               imageURL: nil))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
