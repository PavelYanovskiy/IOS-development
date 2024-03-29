//
//  NetworkService.swift
//  HomeTask1_No_Storyboard
//
//  Created by Павел Яновский on 16.02.2024.
//

import Foundation

final class NetworkService {
    
    private let session = URLSession.shared
    
    // Access token, выданный VK.
    static var token = ""
    //static var userID = ""
    
    // Запрашиваем список друзей.
    func getFriends(completion: @escaping ([Friend]) -> Void) {
        
        guard let url = URL(string: "https://api.vk.com/method/friends.get?access_token=" + NetworkService.token + "&fields=photo_50,online&v=5.199") else {
            return
        }
        
        session.dataTask(with: url) { (data, _, networkError) in
            
            guard let data = data else {
                return
            }
            
            do {
                let friends = try JSONDecoder().decode(FriendsModel.self, from: data)
                
                // Выводим в консоль
                //print(friends)
                
                completion(friends.response.items)
                
            } catch {
                print(error)
            }
        }.resume()
    }
    
    // Запрашиваем список групп (сообществ).
    func getGroups(completion: @escaping ([Group]) -> Void) {
        
        guard let url = URL(string: "https://api.vk.com/method/groups.get?access_token=" + NetworkService.token + "&extended=1&fields=description&v=5.199") else {
            return
        }
        
        session.dataTask(with: url) { (data, _, networkError) in
            
            guard let data = data else {
                return
            }
            
            do {
                let groups = try JSONDecoder().decode(GroupsModel.self, from: data)
                
                // Выводим в консоль
                //print(groups)
                
                completion(groups.response.items)
                
            } catch {
                print(error)
            }
        }.resume()
    }
    
    // Запрашиваем фото.
    func getPhotos(completion: @escaping ([Photo]) -> Void) {
        
        guard let url = URL(string: "https://api.vk.com/method/photos.get?access_token=" + NetworkService.token + "&album_id=wall&v=5.199") else {
            return
        }
        
        session.dataTask(with: url) { (data, _, networkError) in
            
            guard let data = data else {
                return
            }
            
            do {
                let photos = try JSONDecoder().decode(PhotosModel.self, from: data)
                
                // Выводим в консоль
                //print(photos)
                
                completion(photos.response.items)
                
            } catch {
                print(error)
            }
        }.resume()
    }
}

// Запрашиваем данные профиля.
func getProfileInfo(session: URLSession, completion: @escaping (Profile) -> Void) {
    guard let url = URL(string: "https://api.vk.com/method/account.getProfileInfo?access_token=" + NetworkService.token + "&v=5.199") else {
           return
       }
       
       URLSession.shared.dataTask(with: url) { (data, _, networkError) in
           guard let data = data else {
               return
           }
           
           do {
               let profileResponse = try JSONDecoder().decode(ProfileResponse.self, from: data)
               completion(profileResponse.response)
           } catch {
               print(error)
           }
       }.resume()
   }




