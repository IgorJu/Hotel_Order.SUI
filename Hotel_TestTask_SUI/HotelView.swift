//
//  ContentView.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 09.09.2023.
//

import SwiftUI

struct HotelView: View {
    
    @StateObject private var viewModel = HotelViewModel()
    
    var body: some View {
        VStack {
            Text("Отель")
            if let imageURL = viewModel.hotel?.imageURLs.first {
                AsyncImage(url: URL(string: imageURL)) { image in
                    image
                        .resizable()
                        .frame(width: 200, height: 200)
                        .cornerRadius(100)
                } placeholder: {
                    Image(systemName: "xmark.seal.fill")
                        .resizable()
                        .frame(width: 200, height: 200)
                }
            } else {
                Image(systemName: "xmark.seal.fill")
                    .resizable()
                    .frame(width: 200, height: 200)
            }
        }
        .padding()
        .task {
            await viewModel.fetchHotel()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HotelView()
    }
}
