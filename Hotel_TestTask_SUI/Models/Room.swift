//
//  Room.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 13.09.2023.
//

import Foundation

struct HotelR: Decodable {
    let rooms: [Room]
}

struct Room: Decodable {
    let id: Int
    let name: String
    let price: Int
    let pricePer: String
    let peculiarities: [String]
    let imageUrls: [String]

}
