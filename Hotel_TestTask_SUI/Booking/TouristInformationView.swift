//
//  TouristInformationView.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 16.09.2023.
//

import SwiftUI

struct TouristInformationView: View {
    var body: some View {
        VStack {
            HStack {
                fontSFPro(text: "Первый турист", size: 22)
                    .bold()
                Spacer()
                Button {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 6)
                            .frame(width: 32, height: 32)
                            .foregroundColor(.blue.opacity(0.2))
                        Image(systemName: "chevron.up")
                            .frame(width: 6, height: 12)
                    }
                }
            }
            CustomTFView(text: "Имя", placeHolder: "", textToWrite: "Иван", isHaveTitle: true)
            CustomTFView(text: "Фамилия", placeHolder: "", textToWrite: "Иванов", isHaveTitle: true)
            CustomTFView(text: "Дата рождения", placeHolder: "Дата рождения", textToWrite: "", isHaveTitle: false)
            CustomTFView(text: "Гражданство", placeHolder: "Гражданство", textToWrite: "", isHaveTitle: false)
            CustomTFView(text: "Номер загранпаспорта", placeHolder: "Номер загранпаспорта", textToWrite: "", isHaveTitle: false)
            CustomTFView(text: "Срок действия загранпаспорта", placeHolder: "Срок действия загранпаспорта", textToWrite: "", isHaveTitle: false)
            
            
        }
    }
}


struct TouristInformationView_Previews: PreviewProvider {
    static var previews: some View {
        TouristInformationView()
    }
}
