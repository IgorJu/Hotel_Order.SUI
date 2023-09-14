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
        NavigationView {
            List(viewModel.rooms, id: \.name) { roomDetailsViewModel in
                NavigationLink(destination: EmptyView()) {
                    RoomRowView(viewModel: roomDetailsViewModel) // correct it
                }
            }
        }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                CustomBackButton(text: nameHotel)
            }
            
            
        
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
            Text(text)
                .foregroundColor(.black)
                .font(.system(size: 20))
                .frame(width: 300, height: 150)
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
