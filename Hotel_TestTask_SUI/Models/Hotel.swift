//
//  Hotel.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 09.09.2023.
//

import Foundation

struct Hotel: Decodable {
    let id: Int
    let name, adress: String
    let minimalPrice: Int
    let priceForIt: String
    let rating: Int
    let ratingName: String
    let imageUrls: [String]
    let aboutTheHotel: AboutTheHotel

//    enum CodingKeys: String, CodingKey {
//        case id, name, adress
//        case minimalPrice = "minimal_price"
//        case priceForIt = "price_for_it"
//        case rating
//        case ratingName = "rating_name"
//        case imageUrls = "image_urls"
//        case aboutTheHotel = "about_the_hotel"
//    }
}

// MARK: - AboutTheHotel
struct AboutTheHotel: Decodable {
    let description: String
    let peculiarities: [String]
}
