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
                fontSFPro(text: "Отель", size: 18)
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
                            fontSFPro(text: "★ \(rating) \(ratingName)", size: 16)
                                .foregroundColor(.yellow)
                        } else {
                            Text("Рейтинг отеля недоступен")
                        }
                    }
                    //название
                    fontSFPro(text: viewModel.hotel?.name ?? "", size: 22)
                        .padding(.bottom, 2)
                    
                    //адрес
                    Button {
                        
                    } label: {
                        fontSFPro(text: viewModel.hotel?.adress ?? "", size: 14)                        }
                    
                    //цена
                    if let minimalPrice = viewModel.hotel?.minimalPrice,
                       let priceForIt = viewModel.hotel?.priceForIt {
                        
                        HStack.init(alignment: .firstTextBaseline) {
                            fontSFPro(text: "От \(formatNumber(minimalPrice)) ₽", size: 30)
                                .bold()
                            fontSFPro(text: priceForIt, size: 16)
                                .foregroundColor(.gray)
                        }
                        fontSFPro(text: "Об отеле", size: 22)
                        
                    }
                    
                    
                    //информация
                    if let peculiarities = viewModel.hotel?.aboutTheHotel.peculiarities {
                        LazyVGrid(columns: [GridItem()], spacing: 10) {
                            ForEach(peculiarities, id: \.self) { peculiaritie in
                                ViewForPeculiarities(text: peculiaritie, width: CGFloat(peculiaritie.count * 9))
                                    .frame(width: 200)
                            }
                        }
                        .frame(alignment: .leading)
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
                                    NavigationLink(destination: EmptyView()) {
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
                                        }
                                        .onTapGesture { }
                                    }
                                    .frame(width: 350, height: 40)
                                }
                            }
                            .frame(width: 400, height: 250)
                        }
                        
                        .frame(width: 370, height: 230)
                        
                    }
                    
                    Button {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 370, height: 48)
                            fontSFPro(text: "К выбору номера", size: 19)
                                .foregroundColor(.white)
                            
                        }
                    }
                }

            }
            .padding()
            .task {
                await viewModel.fetchHotel()
            }
        }
    }
    
    private func formatNumber(_ number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter.string(from: NSNumber(value: number)) ?? "\(number)"
    }
    
    private func fontSFPro(text: String, size: CGFloat) -> Text {
        Text(text)
            .font(.custom("SF Pro Display", size: size))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HotelView()
    }
}
