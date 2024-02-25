//
//  News.swift
//  HomeTask5_Swift_UI
//
//  Created by Павел Яновский on 25.02.2024.
//

struct News: Identifiable, Decodable {
    let id: Int
    let title: String
    let date: String
}

struct NewsResponse: Decodable {
    let results: [News]
}
