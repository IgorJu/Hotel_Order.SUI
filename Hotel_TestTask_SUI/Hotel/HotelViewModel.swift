//
//  HotelViewModel.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 09.09.2023.
//

import Foundation

final class HotelViewModel: ObservableObject {
    
    @Published var hotel: HotelDetailsViewModel?
    
    func fetchHotel() async {
        do {
            let hotel = try await NetworkManager.shared.fetchHotel()
            await MainActor.run {
                self.hotel =  HotelDetailsViewModel(hotel: hotel)
            }
        } catch {
            print(error)
        }
    }
}
