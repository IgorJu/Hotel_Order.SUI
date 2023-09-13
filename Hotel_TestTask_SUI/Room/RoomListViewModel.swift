//
//  RoomViewModel.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 13.09.2023.
//

import Foundation

class RoomListViewModel: ObservableObject {
    @Published var rooms: [RoomDetailsViewModel] = []
    
    func fetchRooms() async {
        do {
            let rooms = try await NetworkManager.shared.fetchRooms()
            await MainActor.run {
                self.rooms = rooms.map { RoomDetailsViewModel(room: $0) }
            }
        } catch {
            print(error)
        }
    }
}
