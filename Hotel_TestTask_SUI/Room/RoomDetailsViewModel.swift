//
//  RoomDetailsViewModel.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 13.09.2023.
//

import Foundation

class RoomDetailsViewModel: ObservableObject {
    
    private let room: Room
    
    var name: String {
        room.name
    }
    var price: Int {
        room.price
    }
    var pricePer: String {
        room.pricePer
    }
    
    var peculiarities: [String] {
        room.peculiarities
    }
    
    var id: Int {
        room.id
    }
    
    var imageURLs: [String] {
        room.imageUrls
    }
    
        
    init(room: Room) {
        self.room = room
    }
}
