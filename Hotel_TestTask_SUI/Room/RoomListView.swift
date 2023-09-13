//
//  RoomView.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 13.09.2023.
//

import SwiftUI

struct RoomListView: View {
    @StateObject private var viewModel = RoomListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.rooms, id: \.name) { roomDetailsViewModel in
                NavigationLink(destination: EmptyView()) {
                    RoomRowView(viewModel: roomDetailsViewModel) // correct it
                }
            }
            .navigationTitle("here should be name of the hotel")
        }
        .task {
            await viewModel.fetchRooms()
        }
    }
    
}

struct RoomListView_Previews: PreviewProvider {
    static var previews: some View {
        RoomListView()
    }
}
