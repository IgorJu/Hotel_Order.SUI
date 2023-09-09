//
//  HotelDetailsViewModel.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 09.09.2023.
//
import SwiftUI

class HotelDetailsViewModel: ObservableObject {
    
    private let hotel: Hotel
    
    var name: String {
        hotel.name
    }
    var adress: String {
        hotel.adress
    }
    
    var priceForIt: String {
        hotel.priceForIt
    }
    
    var ratingName: String {
        hotel.ratingName
    }
    
    var imageURLs: [String] {
        hotel.imageUrls
    }
    
    init(hotel: Hotel) {
        self.hotel = hotel
    }
}

