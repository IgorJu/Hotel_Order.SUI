//
//  InfoCustomerView.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 16.09.2023.
//

import SwiftUI

struct InfoCustomerView: View {
    @State var phoneNumber: String
    @State var email: String
    
    var body: some View {
        VStack {
            fontSFPro(text: "Информация о покупателе", size: 22)
                .bold()
            PhoneTexFieldView(text: "Номер телефона", placeHolder: "")
            MailTextFieldView(text: "Почта", placeHolder: "", editingText: "")
            fontSFPro(text: "Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту", size: 14)
                .foregroundColor(.gray)
                
        }
    }
}

struct InfoCustomerView_Previews: PreviewProvider {
    static var previews: some View {
        InfoCustomerView(phoneNumber: "897564", email: "@mail.ru")
    }
}
