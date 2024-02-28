//
//  ProfileModel.swift
//  HomeTask1_No_Storyboard
//
//  Created by Павел Яновский on 25.02.2024.
//

struct ProfileModel: Decodable {
    let response: Profile
}

struct Profile: Decodable {
    let firstName: String
    let lastName: String
    let photo: String?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_200"
    }
}
struct ProfileResponse: Decodable {
    let response: Profile
}
