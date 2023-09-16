//
//  RoomView.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 13.09.2023.
//

import SwiftUI

struct RoomListView: View {
    @StateObject private var viewModel = RoomListViewModel()
    
    let nameHotel: String
    
    var body: some View {
        List(viewModel.rooms, id: \.name) { roomDetailsViewModel in
            RoomRowView(viewModel: roomDetailsViewModel)
        }
        .frame(width: 410)
        
        .toolbar {
            CustomBackButton(text: nameHotel)
        }
        .navigationBarBackButtonHidden(true)
        
        .task {
            await viewModel.fetchRooms()
        }
    }
}
    



struct RoomListView_Previews: PreviewProvider {
    static var previews: some View {
        RoomListView(nameHotel: "some hotel")
    }
}
