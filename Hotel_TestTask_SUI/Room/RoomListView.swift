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
        
        .toolbar {
            CustomBackButton(text: nameHotel)
        }
        .navigationBarBackButtonHidden(true)
        
        .task {
            await viewModel.fetchRooms()
        }
    }
}
    


struct CustomBackButton: View {
    @Environment(\.presentationMode) var presentationMode
    let text: String
    
    var body: some View {
        HStack {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.backward")
                    .foregroundColor(.black)
                    .font(.system(size: 14))
                    .frame(alignment: .leading)
            }
            Spacer()
            Text(text)
                .foregroundColor(.black)
                .font(.system(size: 16))
                .bold()
                .frame(width: 300, height: 250, alignment: .center)
                .lineLimit(nil)
            Spacer()
        }
        
        
    }
}

struct RoomListView_Previews: PreviewProvider {
    static var previews: some View {
        RoomListView(nameHotel: "some hotel")
    }
}
