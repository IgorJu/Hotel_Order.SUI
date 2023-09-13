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
//        } else {
//            Image(systemName: "xmark.seal.fill")
//                .resizable()
//                .frame(width: 200, height: 200)
//        }
    }
    
}



//struct RoomRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        RoomRowView(viewModel: RoomDetailsViewModel(room: Room(id: <#T##Int#>, name: "Luxe", price: 12400, pricePer: <#T##String#>, peculiarities: <#T##[String]#>, imageUrls: <#T##[String]#>)))
//    }
//}
