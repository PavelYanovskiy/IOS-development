//
//  NetworkService.swift
//  HomeTask5_Swift_UI
//
//  Created by Павел Яновский on 25.02.2024.
//

import Foundation
class NetworkService {
    func fetchNews(completion: @escaping ([News]?) -> Void) {
        guard let url = URL(string: "https://kudago.com/public-api/v1.4/news/?lang=&fields=&expand=&order_by=&text_format=&ids=&location=&actual_only=true") else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let decodedData = try decoder.decode(NewsResponse.self, from: data)
                    completion(decodedData.results)
                } catch let jsonError {
                    print("Error decoding data: \(jsonError)")
                    completion(nil)
                }
            } else {
                print("No data received")
                completion(nil)
            }
        }.resume()
    }
}



