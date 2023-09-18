//
//  MailTextFieldView.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 18.09.2023.
//

import SwiftUI

struct MailTextFieldView: View {
    
    let text: String
    let placeHolder: String
    
    @State private var editingText: String
    
    init(text: String, placeHolder: String, editingText: String) {
            self.text = text
            self.placeHolder = placeHolder
            self._editingText = State(initialValue: editingText)
        }
    
    var body: some View {
        ZStack {
            if isValidEmail(editingText) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 343, height: 52)
                    .foregroundColor(.gray.opacity(0.1))
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 343, height: 52)
                    .foregroundColor(Color(red: 235/255, green: 87/255, blue: 87/255, opacity: 0.15))
            }
            
            VStack.init(alignment: .leading) {
                Text(text)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 5)
                    .font(.system(size: 12))
                TextField("", text: $editingText)
                    .textFieldStyle(.plain)
                    .padding(.horizontal, 16)
            }
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
        return emailPredicate.evaluate(with: email)
    }
}

struct MailTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        MailTextFieldView(text: "Почта", placeHolder: "", editingText: "")
    }
}
