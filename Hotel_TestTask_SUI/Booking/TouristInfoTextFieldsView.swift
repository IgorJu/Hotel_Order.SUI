//
//  TouristInfoTextFieldsView.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 17.09.2023.
//

import SwiftUI

struct TouristInfoTextFieldsView: View {
    var body: some View {
        VStack {
            CustomTFView(text: "Имя", placeHolder: "", textToWrite: "Иван", isHaveTitle: true)
            CustomTFView(text: "Фамилия", placeHolder: "", textToWrite: "Иванов", isHaveTitle: true)
            CustomTFView(text: "Дата рождения", placeHolder: "Дата рождения", textToWrite: "", isHaveTitle: false)
            CustomTFView(text: "Гражданство", placeHolder: "Гражданство", textToWrite: "", isHaveTitle: false)
            CustomTFView(text: "Номер загранпаспорта", placeHolder: "Номер загранпаспорта", textToWrite: "", isHaveTitle: false)
            CustomTFView(text: "Срок действия загранпаспорта", placeHolder: "Срок действия загранпаспорта", textToWrite: "", isHaveTitle: false)
        }
    }
}

struct TouristInfoTextFieldsView_Previews: PreviewProvider {
    static var previews: some View {
        TouristInfoTextFieldsView()
    }
}
