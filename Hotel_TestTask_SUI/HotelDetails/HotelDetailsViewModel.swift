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
    var minimalPrice: Int {
        hotel.minimalPrice
    }
    
    var priceForIt: String {
        hotel.priceForIt
    }
    var rating: Int {
        hotel.rating
    }
    
    var ratingName: String {
        hotel.ratingName
    }
    
    var imageURLs: [String] {
        hotel.imageUrls
    }
    
    var aboutTheHotel: AboutTheHotel {
        hotel.aboutTheHotel
    }
    
    var comforts = ["Удобства", "Что включено", "Что не включено"]
    var images = ["emoji-happy", "tick-square", "close-square"]

    init(hotel: Hotel) {
        self.hotel = hotel
    }
}

