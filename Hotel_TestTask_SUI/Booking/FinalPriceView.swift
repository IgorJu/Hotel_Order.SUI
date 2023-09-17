//
//  FinalPriceView.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 17.09.2023.
//

import SwiftUI

struct FinalPriceView: View {
    let tourPrice: Int
    let fuelCharge: Int
    let serviceCharge: Int
    var finalPrice: Int {
        tourPrice + fuelCharge + serviceCharge
    }
    
    
    var body: some View {
        VStack {
            HStack {
                VStack.init(alignment: .leading, spacing: 5) {
                    fontSFPro(text: "Тур", size: 16)
                    fontSFPro(text: "Топливный сбор", size: 16)
                    fontSFPro(text: "Сервисный сбор", size: 16)
                    fontSFPro(text: "К оплате", size: 16)
                }.foregroundColor(.gray)
                Spacer()
                VStack.init(alignment: .trailing, spacing: 5) {
                    fontSFPro(text: "\(formatNumber(tourPrice)) ₽", size: 16)
                    fontSFPro(text: "\(formatNumber(fuelCharge)) ₽", size: 16)
                    fontSFPro(text: "\(formatNumber(serviceCharge)) ₽", size: 16)
                    fontSFPro(text: "\(formatNumber(finalPrice)) ₽", size: 16)
                        .foregroundColor(.blue)
                }
            }
            NavigationLink(destination: PaidView()) {
                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .frame(width: 343, height: 48)
                        .foregroundColor(.blue)
                    fontSFPro(text: "Оплатить \(formatNumber(finalPrice)) ₽", size: 16)
                    .foregroundColor(.white)                }
                
            }
        }
    }
}
    
    struct FinalPriceView_Previews: PreviewProvider {
        static var previews: some View {
            FinalPriceView(tourPrice: 285000, fuelCharge: 2300, serviceCharge: 7500)
        }
    }
