//
//  BookingViewModel.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 14.09.2023.
//

import Foundation

final class BookingViewModel: ObservableObject {
    
    @Published var booking: BookingDetailsViewModel?
    
    func fetchBooking() async {
        do {
            let booking = try await NetworkManager.shared.fetchBooking()
            await MainActor.run {
                self.booking =  BookingDetailsViewModel(booking: booking)
            }
        } catch {
            print(error)
        }
    }
}
