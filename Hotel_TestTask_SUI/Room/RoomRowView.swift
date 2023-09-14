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
        VStack {
            TabView {
                ForEach(viewModel.imageURLs, id: \.self) { imageName in
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
            
            Text(viewModel.name)
                .font(.system(size: 22))
                .bold()
            HStack {
                ViewForPeculiarities(text: viewModel.peculiarities[0], width: CGFloat(viewModel.peculiarities[0].count * 10))
                    .bold()
                ViewForPeculiarities(text: viewModel.peculiarities[1], width: 150)
            }
            
            Button {
                
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 250, height: 30)
                        .foregroundColor(.blue.opacity(0.1))
                    HStack {
                        Text("Подробнее о номере")
                            .font(.system(size: 14))
                        Image(systemName: "chevron.right")
                    }
                }
            }
            HStack.init(alignment: .firstTextBaseline) {
                Text("\(formatNumber(viewModel.price))) ₽")
                    .font(.system(size: 26))
                    .lineLimit(nil)
                    .bold()
                Text(viewModel.pricePer)
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                
            }
            
            //        } else {
            //            Image(systemName: "xmark.seal.fill")
            //                .resizable()
            //                .frame(width: 200, height: 200)
            //        }
        }
    }
}



//struct RoomRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        RoomRowView(viewModel: RoomDetailsViewModel(room: Room(id: <#T##Int#>, name: "Luxe", price: 12400, pricePer: <#T##String#>, peculiarities: <#T##[String]#>, imageUrls: <#T##[String]#>)))
//    }
//}
