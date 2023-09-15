//
//  RatingView.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 15.09.2023.
//

import SwiftUI

struct RatingView: View {
    let rating: Int
    let ratingName: String
    
    var body: some View {
        //MARK: - Рейтинг
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.yellow.opacity(0.25))
                .frame(width: 160, height: 30)
            fontSFPro(text: "★ \(rating) \(ratingName)", size: 16)
                .foregroundColor(Color.yellow)
                .bold()
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 5, ratingName: "Good")
    }
}
