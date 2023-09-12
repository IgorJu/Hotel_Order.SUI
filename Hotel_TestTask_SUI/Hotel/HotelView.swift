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
        ScrollView {
            VStack {
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
                            if let rating = viewModel.hotel?.rating,
                               let ratingName = viewModel.hotel?.ratingName {
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
                        
                        //цена
                        if let minimalPrice = viewModel.hotel?.minimalPrice,
                           let priceForIt = viewModel.hotel?.priceForIt {
                            
                            HStack.init(alignment: .firstTextBaseline) {
                                Text("От \(formatNumber(minimalPrice))")
                                    .font(.custom("SF Pro Display", size: 30))
                                    .bold()
                                Text(priceForIt)
                                    .foregroundColor(.gray)
                            }
                            Text("Об отеле")
                                .font(.custom("SF Pro Display", size: 22))
                        }
                    }
                    .background(Color.white)
                    
                    VStack {
                        //информация
                        if let peculiarities = viewModel.hotel?.aboutTheHotel.peculiarities {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], spacing: 10) {
                                ForEach(peculiarities, id: \.self) { peculiaritie in
                                    ViewForPeculiarities(text: peculiaritie, width: CGFloat(peculiaritie.count * 9))
                                        .frame(width: 200)
                                }
                            }
                        }
                        
                        // описание
                        if let description = viewModel.hotel?.aboutTheHotel.description {
                            Text(description)
                                .font(.custom("SF Pro Display", size: 16))
                        }
                        
                        //удобства
                        if let comforts = viewModel.hotel?.comforts,
                           let images = viewModel.hotel?.images {
                            NavigationView {
                                List {
                                    ForEach(comforts, id: \.self) { comfort in
                                        NavigationLink(destination: EmptyView()) {
                                            HStack {
                                                ForEach(images, id: \.self) { image in
                                                    Image(systemName: image)
                                                    
                                                }
                                                VStack(alignment: .leading) {
                                                    Text(comfort)
                                                    Text("Самое необходимое")
                                                        .foregroundColor(.gray)
                                                }
                                            }
                                        }
                                        .onTapGesture { }
                                        .frame(width: 350, height: 40)
                                    }
                                }
                                .frame(width: 400, height: 250)
                            }
                            
                            .frame(width: 370, height: 230)
                            
                        }
                    }
                }
                .background(Color.white)
                .padding()
                .task {
                    await viewModel.fetchHotel()
                }
            }
        }
        
    }
    
    private func formatNumber(_ number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter.string(from: NSNumber(value: number)) ?? "\(number)"
    }

}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HotelView()
    }
}
