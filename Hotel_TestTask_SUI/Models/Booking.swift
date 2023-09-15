//
//  Booking.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 14.09.2023.
//

import Foundation

struct Booking: Decodable {
    let id: Int
    let hotelName, hotelAdress: String
    let horating: Int
    let ratingName, departure, arrivalCountry, tourDateStart: String
    let tourDateStop: String
    let numberOfNights: Int
    let room, nutrition: String
    let tourPrice, fuelCharge, serviceCharge: Int
}
