//
//  NetworkService.swift
//  HomeTask1_No_Storyboard
//
//  Created by Павел Яновский on 16.02.2024.
//

import Foundation
final class NetworkService {

    static let session = URLSession.shared
    static var token = ""

    static func getFriends() {

        if let url = URL(string: "https://api.vk.com/method/friends.get?access_token=" + NetworkService.token + "&fields=photo_50&v=5.199") {

            session.dataTask(with: url) { (data, _, networkError) in

                if let data = data {

                    do {
                        let friends = try JSONDecoder().decode(FriendsModel.self, from: data)
                        print(friends)

                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    }

    static func getGroups() {

        if let url = URL(string: "https://api.vk.com/method/groups.get?access_token=" + NetworkService.token + "&extended=1&fields=description&v=5.199") {

            session.dataTask(with: url) { (data, _, networkError) in

                if let data = data {

                    do {
                        let groups = try JSONDecoder().decode(GroupsModel.self, from: data)
                        print(groups)

                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    }

    static func getPhotos() {

        if let url = URL(string: "https://api.vk.com/method/photos.get?access_token=" + NetworkService.token + "&album_id=wall&v=5.199") {

            session.dataTask(with: url) { (data, _, networkError) in

                if let data = data {

                    do {
                        let photos = try JSONDecoder().decode(PhotosModel.self, from: data)
                        print(photos)

                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    }
}

