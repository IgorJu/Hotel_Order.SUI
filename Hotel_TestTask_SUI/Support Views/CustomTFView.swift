//
//  CustomTFView.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 16.09.2023.
//

import SwiftUI

struct CustomTFView: View {
    
    let text: String
    let placeHolder: String
    @State var textToWrite: String
    
    let isHaveTitle: Bool
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 343, height: 52)
                .foregroundColor(.gray.opacity(0.1))
            if isHaveTitle {
                VStack.init(alignment: .leading) {
                    Text(text)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 5)
                        .font(.system(size: 12))
                    TextField("", text: $textToWrite)
                        .textFieldStyle(.plain)
                        .padding(.horizontal, 16)
                }
            } else {
                TextField(placeHolder, text: $textToWrite)
                    .textFieldStyle(.plain)
                    .padding(.horizontal, 16)
                
            }
        }
    }
}

struct CustomTFView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTFView(text: "Номер телефона", placeHolder: "", textToWrite: "", isHaveTitle: true)
    }
}
