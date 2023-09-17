//
//  CustomBackButton.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 16.09.2023.
//

import SwiftUI


struct CustomBackButton: View {
    
    @Environment(\.presentationMode) var presentationMode
    let text: String
    
    var body: some View {
        HStack {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.backward")
                    .foregroundColor(.black)
                    .font(.system(size: 14))
                    .frame(alignment: .leading)
            }
            Spacer()
            Text(text)
                .foregroundColor(.black)
                .font(.system(size: 16))
                .bold()
                .frame(width: 300, height: 50, alignment: .center)
                .lineLimit(nil)
            Spacer()
        }
        .frame(alignment: .center)
    }
}


struct CustomBackButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomBackButton(text: "Back")
    }
}
