//
//  HStackForDoubleText.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 15.09.2023.
//

import SwiftUI

struct TripInformationView: View {
    
    let departure: String
    let arrival: String
    let dateStart: String
    let dateStop: String
    let countOfNights: Int
    let hotel: String
    let roomName: String
    let food: String
    
    var body: some View {
        HStack {
            VStack.init(alignment: .leading, spacing: 20) {
                fontSFPro(text: "Вылет из", size: 16)
                fontSFPro(text: "Страна, город", size: 16)
                fontSFPro(text: "Даты", size: 16)
                fontSFPro(text: "Кол-во ночей", size: 16)
                fontSFPro(text: "Отель", size: 16)
                    .frame(height: 40)
                fontSFPro(text: "Номер", size: 16)
                    .frame(height: 40)
                fontSFPro(text: "Питание", size: 16)
                
            }
            .foregroundColor(.gray)
            .padding(.trailing, 20)
            
            VStack.init(alignment: .leading, spacing: 20) {
                fontSFPro(text: departure, size: 16)
                fontSFPro(text: arrival, size: 16)
                fontSFPro(text: "\(dateStart) - \(dateStop)", size: 16)
                fontSFPro(text: "\(countOfNights.formatted()) ночей", size: 16)
                fontSFPro(text: hotel, size: 16)
                    .frame(height: 40)
                fontSFPro(text: roomName, size: 16)
                    .frame(height: 40)
                fontSFPro(text: food, size: 16)
            }
            
        }
        
    }
}

struct TripInformationView_Previews: PreviewProvider {
    static var previews: some View {
        TripInformationView(departure: "Piter", arrival: "egipet", dateStart: "21", dateStop: "24", countOfNights: 7, hotel: "hotel", roomName: "some room", food: "all inclusive")
    }
}
