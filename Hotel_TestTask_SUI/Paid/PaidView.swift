//
//  PaidView.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 17.09.2023.
//

import SwiftUI

struct PaidView: View {
    var body: some View {
        VStack.init(alignment: .center, spacing: 20) {
            Spacer()
            ZStack {
                Circle()
                    .frame(width: 94)
                    .foregroundColor(.gray.opacity(0.2))
                fontSFPro(text: "🎉", size: 40)
            }
            
            fontSFPro(text: "Ваш заказ принят в работу", size: 22)
                .bold()
            fontSFPro(text: "Подтверждение заказа № \(Int.random(in: 1...10000)) может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.", size: 16)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            Spacer()
            NavigationLink(destination: HotelView()) {
                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .frame(width: 343, height: 48)
                        .foregroundColor(.blue)
                    Text("Супер!")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 20)
                
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                CustomBackButton(text: "Заказ оплачен")
            }
        }
        .padding(.horizontal, 10)
    }
}
    
    struct PaidView_Previews: PreviewProvider {
        static var previews: some View {
            PaidView()
        }
    }
