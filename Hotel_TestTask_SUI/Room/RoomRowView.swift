//
//  RoomRowView.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 13.09.2023.
//

import SwiftUI

struct RoomRowView: View {
    let viewModel: RoomDetailsViewModel
    
    var body: some View {
            
                VStack.init(alignment: .leading){
                    //MARK: - Таб вью с фотографиями
                    TabView {
                        ForEach(viewModel.imageURLs, id: \.self) { imageName in
                            AsyncImage(url: URL(string: imageName)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 330, height: 260)
                            .cornerRadius(10)
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .always))
                    .frame(width: 330, height: 260, alignment: .center)
                    .cornerRadius(10)
                    .aspectRatio( contentMode: .fit)
                    
                    //MARK: - Название
                    Text(viewModel.name)
                        .font(.system(size: 22))
                        .bold()
                    
                    //MARK: - Удобства
                        HStack {
                            ViewForPeculiarities(text: viewModel.peculiarities[0], width: CGFloat(viewModel.peculiarities[0].count * 9))
                            ViewForPeculiarities(text: viewModel.peculiarities[1], width: CGFloat(viewModel.peculiarities[1].count * 9))
                        }
                        .frame(width: 330, alignment: .leading)
                    
                    
                    //MARK: - Подробнее о номере
                    Button {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 200, height: 30)
                                .foregroundColor(.blue.opacity(0.1))
                            HStack {
                                Text("Подробнее о номере")
                                    .font(.system(size: 14))
                                    .bold()
                                Image(systemName: "chevron.right")
                            }
                        }
                        .frame(alignment: .leading)
                    }
                    
                    //MARK: - Цена
                    HStack.init(alignment: .firstTextBaseline) {
                        Text("\(formatNumber(viewModel.price)) ₽")
                            .font(.system(size: 26))
                            .lineLimit(nil)
                            .bold()
                        Text(viewModel.pricePer)
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                        
                    }
                    NavigationLink(destination: EmptyView()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 14)
                                .frame(width: 330, height: 48)
                                .foregroundColor(.blue)
                            Text("Выбрать номер")
                                .font(.system(size: 19))
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding(.leading, 15)
            
        
    }
}



struct RoomRowView_Previews: PreviewProvider {
    static var previews: some View {
        RoomRowView(viewModel: RoomDetailsViewModel(room: Room(id: 1, name: "Luxe", price: 124000, pricePer: "за 7 ночей с перелетом", peculiarities: ["Включен только завтрак","Кондиционер"], imageUrls: [])))
    }
}
