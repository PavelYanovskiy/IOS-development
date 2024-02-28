//
//  NewsListView.swift
//  HomeTask5_Swift_UI
//
//  Created by Павел Яновский on 25.02.2024.
//

import SwiftUI

struct NewsListView: View {
    @State private var news: [News] = []
    private let networkService = NetworkService()

    var body: some View {
        List(news) { newsItem in
            VStack(alignment: .leading) {
                Text(newsItem.title)
                    .font(.headline)
                if let date = newsItem.date {
                    Text("\(date)") // Преобразование Double? в String здесь
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
        .onAppear {
            networkService.fetchNews { fetchedNews in
                if let fetchedNews = fetchedNews {
                    self.news = fetchedNews
                }
            }
        }
    }
}
