//
//  BookingDetailViewModel.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 14.09.2023.
//

import Foundation

final class BookingDetailsViewModel: ObservableObject {
    private let booking: Booking
    
    var id: Int {
        booking.id
    }
    
    var hotelName: String {
        booking.hotelName
    }
    
    var hotelAdress: String {
        booking.hotelAdress
    }
    
    var horating: Int {
        booking.horating
    }
    var ratingName: String {
        booking.ratingName
    }
    
    var departure: String {
        booking.departure
    }
    
    var arrivalCountry: String {
        booking.arrivalCountry
    }
    
    var tourDateStart: String {
        booking.tourDateStart
    }
    
    var tourDateStop: String {
        booking.tourDateStop
    }
    
    var numberOfNights: Int {
        booking.numberOfNights
    }
    
    var room: String {
        booking.room
    }
    
    var nutrition: String {
        booking.nutrition
    }
    
    var tourPrice: Int {
        booking.tourPrice
    }
    
    var fuelCharge: Int {
        booking.fuelCharge
    }
    
    var serviceCharge: Int {
        booking.serviceCharge
    }
    
    init(booking: Booking) {
        self.booking = booking
    }
}
