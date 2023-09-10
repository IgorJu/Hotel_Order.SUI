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
                .font(.custom("SF Pro Display", size: 18))
            //табвью с картинками
            if let imageURLs = viewModel.hotel?.imageURLs {
                TabView {
                    ForEach(imageURLs, id: \.self) { imageName in
                        AsyncImage(url: URL(string: imageName)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 360, height: 300)
                        .cornerRadius(10)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .frame(width: 360, height: 300)
                .cornerRadius(10)
                .aspectRatio( contentMode: .fit)
            } else {
                Image(systemName: "xmark.seal.fill")
                    .resizable()
                    .frame(width: 200, height: 200)
            }
            VStack(alignment: .leading) {
                //рейтинг
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.yellow.opacity(0.25))
                        .frame(width: 160, height: 30)
                    if let rating = viewModel.hotel?.rating, let ratingName = viewModel.hotel?.ratingName {
                        Text("★ \(rating) \(ratingName)")
                            .foregroundColor(.yellow)
                            .font(.custom("SF Pro Display", size: 16))
                    } else {
                        Text("Рейтинг отеля недоступен")
                    }
                }
                //название
                Text(viewModel.hotel?.name ?? "")
                    .font(.custom("SF Pro Display", size: 22))
                    .padding(.bottom, 2)
                //адрес
                Button {
                    
                } label: {
                    Text(viewModel.hotel?.adress ?? "")
                        .font(.custom("SF Pro Display", size: 14))
                }
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
