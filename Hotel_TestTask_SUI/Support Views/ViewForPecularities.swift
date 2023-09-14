//
//  ViewForPecularities.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 12.09.2023.
//

import SwiftUI

struct ViewForPeculiarities: View {
    let text: String
    let width: CGFloat
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: width, height: 26)
                .foregroundColor(.gray.opacity(0.05))
            Text(text)
                .foregroundColor(.gray)
                .font(.custom("SF Pro Display", size: 14))
            
        }
        .frame(width: width)
    }
}

struct ViewForPeculiarities_Previews: PreviewProvider {
    static var previews: some View {
        ViewForPeculiarities(text: "third line", width: 100)
    }
}
