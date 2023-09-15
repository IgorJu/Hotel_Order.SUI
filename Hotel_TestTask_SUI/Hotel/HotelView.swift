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
        NavigationView {
            ScrollView {
                VStack {
                    fontSFPro(text: "Отель", size: 18)
                        .bold()
                    
                    //MARK: - табвью с картинками
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
                        
                        //MARK: - Рейтинг
                        if let rating = viewModel.hotel?.rating,
                           let ratingName = viewModel.hotel?.ratingName {
                            RatingView(rating: rating, ratingName: ratingName)
                        }
                        
                        //MARK: - Название
                        fontSFPro(text: viewModel.hotel?.name ?? "", size: 22)
                            .padding(.bottom, 2)
                            .bold()
                        
                        //MARK: - Адрес
                        Button {
                            
                        } label: {
                            fontSFPro(text: viewModel.hotel?.adress ?? "", size: 14)
                                .bold()
                                .padding(.bottom, 1)
                        }
                        
                        //MARK: - Цена
                        if let minimalPrice = viewModel.hotel?.minimalPrice,
                           let priceForIt = viewModel.hotel?.priceForIt {
                            
                            HStack.init(alignment: .firstTextBaseline) {
                                fontSFPro(text: "От \(formatNumber(minimalPrice)) ₽", size: 30)
                                    .bold()
                                fontSFPro(text: priceForIt, size: 16)
                                    .foregroundColor(.gray)
                                
                            }
                        }
                        
                        //dividing line
                        DivideLine(lineWidth: 4)
                        
                        //MARK: - Информация
                        //об отеле
                        fontSFPro(text: "Об отеле", size: 22)
                            .bold()
                        
                        if let peculiarities = viewModel.hotel?.aboutTheHotel.peculiarities {
                            ViewForPeculiarities(text: peculiarities[0], width: CGFloat(peculiarities[0].count * 8))
                            HStack {
                                ViewForPeculiarities(text: peculiarities[1], width: CGFloat(peculiarities[1].count * 8))
                                ViewForPeculiarities(text: peculiarities[2], width: CGFloat(peculiarities[2].count * 8))
                            }
                            ViewForPeculiarities(text: peculiarities[3], width: CGFloat(peculiarities[3].count * 8))
                        }
                        
                        // описание
                        if let description = viewModel.hotel?.aboutTheHotel.description {
                            fontSFPro(text: description, size: 16)
                            
                        }
                        
                        //удобства
                        if let comforts = viewModel.hotel?.comforts,
                           let images = viewModel.hotel?.images {
                            NavigationView {
                                List {
                                    ForEach(comforts, id: \.self) { comfort in
                                        HStack {
                                            Image(images[comforts.firstIndex(of: comfort) ?? 0])
                                                .resizable()
                                                .frame(width: 24, height: 24)
                                                .aspectRatio(contentMode: .fit)
                                            
                                            VStack(alignment: .leading) {
                                                fontSFPro(text: comfort, size: 16)
                                                fontSFPro(text: "Самое необходимое", size: 14)
                                                    .foregroundColor(.gray)
                                            }
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                        }
                                        .frame(width: 350, height: 40)
                                    }
                                }
                                .frame(width: 400, height: 250)
                            }
                            .frame(width: 370, height: 230)
                        }
                        
                        //MARK: - к выбору номера
                        NavigationLink(destination: RoomListView(nameHotel: viewModel.hotel?.name ?? "name is absent")) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 370, height: 48)
                                Text("К выбору номера")
                                    .font(.system(size: 19))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding()
                }
                .padding(.horizontal, 10)
            }
            
            .task {
                await viewModel.fetchHotel()
            }
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HotelView()
    }
}
