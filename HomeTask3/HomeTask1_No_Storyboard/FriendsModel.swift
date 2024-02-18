//
//  FriendsModel.swift
//  HomeTask1_No_Storyboard
//
//  Created by Павел Яновский on 16.02.2024.
//

struct FriendsModel: Decodable {
    let response: FriendsItems
}

struct FriendsItems: Decodable {
    let items: [Friend]
}

struct Friend: Decodable {
    let firstName: String
    let lastName: String
    let photo: String
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_50"
    }
}
