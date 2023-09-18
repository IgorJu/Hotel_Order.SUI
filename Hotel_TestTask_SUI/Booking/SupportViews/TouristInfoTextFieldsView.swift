//
//  TouristInfoTextFieldsView.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 17.09.2023.
//

import SwiftUI

struct TouristInfoTextFieldsView: View {
    
    @Binding var textToWrite: String
    
    var body: some View {
        VStack {
            CustomTFView(text: "Имя", placeHolder: "", textToWrite: textToWrite, isHaveTitle: true)
            CustomTFView(text: "Фамилия", placeHolder: "", textToWrite: textToWrite, isHaveTitle: true)
            CustomTFView(text: "Дата рождения", placeHolder: "Дата рождения", textToWrite: textToWrite, isHaveTitle: false)
            CustomTFView(text: "Гражданство", placeHolder: "Гражданство", textToWrite: textToWrite, isHaveTitle: false)
            CustomTFView(text: "Номер загранпаспорта", placeHolder: "Номер загранпаспорта", textToWrite: textToWrite, isHaveTitle: false)
            CustomTFView(text: "Срок действия загранпаспорта", placeHolder: "Срок действия загранпаспорта", textToWrite: textToWrite, isHaveTitle: false)
        }
    }
}

struct TouristInfoTextFieldsView_Previews: PreviewProvider {
    @State private static var textToWrite: String = "Initial Text"
    
    static var previews: some View {
        TouristInfoTextFieldsView(textToWrite: $textToWrite)
    }
}
