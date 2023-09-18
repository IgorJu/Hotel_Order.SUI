//
//  PhoneTextFieldView.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 18.09.2023.
//

import SwiftUI

struct PhoneTexFieldView: View {
    
    let text: String
    let placeHolder: String
    @State private var phoneNumber = "+7 (***) ***-**-**"
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 343, height: 52)
                .foregroundColor(.gray.opacity(0.1))
            
            VStack.init(alignment: .leading) {
                Text(text)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 5)
                    .font(.system(size: 12))
                TextField("", text: $phoneNumber)
                    .textFieldStyle(.plain)
                    .padding(.horizontal, 16)
                    .onChange(of: phoneNumber) { newValue in
                        phoneNumber = format(phoneNumber: newValue, shouldRemoveLastDigit: false)
                        
                    }
            }
        }
    }
}


struct PhoneTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneTexFieldView(text: "Номер телефона", placeHolder: "")
    }
}

