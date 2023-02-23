//
//  TMDBWidget.swift
//  TMDBWidget
//
//  Created by Gabriel Targon on 24/10/22.
//

import WidgetKit
import SwiftUI
import UIKit

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(imageURL: URL(string: "https://www.themoviedb.org/t/p/original/8Zhq0uyk9MLaqJNW3EhDHepAFSP.jpg")!,
                    title: "Teste")
    }

    func getSnapshot(in context: Context,
                     completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(imageURL: URL(string: "https://www.themoviedb.org/t/p/original/8Zhq0uyk9MLaqJNW3EhDHepAFSP.jpg")!,
                                title: "Teste")
        completion(entry)
    }

    func getTimeline(in context: Context,
                     completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        var entries: [SimpleEntry] = []

//        HomeWorker().fetchMovies(endpoint: .nowPlaying) { result in
//            switch result {
//            case .success(let response):
//                let imageURL = response.results[0].posterURL
//                let title = response.results[0].title
//                
//                let entry = SimpleEntry(imageURL: imageURL,
//                                        title: title)
//                
//                let timeline = Timeline(entries: [entry],
//                                        policy: .atEnd)
//                completion(timeline)
//            case .failure:
//                let currentDate = Date()
//                for hourOffset in 0 ..< 5 {
//                    let entryDate = Calendar.current.date(byAdding: .hour,
//                                                          value: hourOffset,
//                                                          to: currentDate)!
//                    let entry = SimpleEntry(date: entryDate,
//                                            imageURL: URL(string: "")!,
//                                            title: "Falhou")
//                    entries.append(entry)
//                }
//                let timeline = Timeline(entries: entries,
//                                        policy: .atEnd)
//                completion(timeline)
//            }
//        }
    }
}

struct SimpleEntry: TimelineEntry{
    var date = Date()
    let imageURL: URL
    let title: String
}

struct TMDBWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        TMDBWidgetView(title: entry.title,
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
        TMDBWidgetEntryView(entry: SimpleEntry(imageURL: URL(string: "https://www.themoviedb.org/t/p/original/8Zhq0uyk9MLaqJNW3EhDHepAFSP.jpg")!,
                                               title: "Teste"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
