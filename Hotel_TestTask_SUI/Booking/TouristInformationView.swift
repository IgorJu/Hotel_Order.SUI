//
//  TouristInformationView.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 16.09.2023.
//

import SwiftUI

struct TouristInformationView: View {
    
    @State var countOfTourist = 1
    @State var addTouiristIsTapped = false
    @State var infoTFisHidden = false
    
    var body: some View {
        VStack {
            HStack {
                fontSFPro(text: "\(numberInRussian(countOfTourist)) турист", size: 22)
                    .bold()
                Spacer()
                Button {
                    withAnimation {
                        infoTFisHidden.toggle()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 6)
                            .frame(width: 32, height: 32)
                            .foregroundColor(.blue.opacity(0.2))
                        Image(systemName: "chevron.down")
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 6, height: 12)
                            .rotationEffect(.degrees(infoTFisHidden ? 0 : 180))
                        
                    }
                }
            }
            if !infoTFisHidden {
                TouristInfoTextFieldsView()
            }
            DivideLine(lineWidth: 7)
            
                .frame(height: 10)
                .padding(.vertical, 5)
            
            if addTouiristIsTapped {
                TouristInformationView(countOfTourist: countOfTourist + 1)
            }
            
            if !addTouiristIsTapped {
                HStack {
                    fontSFPro(text: "Добавить туриста", size: 22)
                        .bold()
                    Spacer()
                    Button {
                        self.addTouiristIsTapped = true
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 6)
                                .frame(width: 32, height: 32)
                                .foregroundColor(.blue)
                            Image(systemName: "plus")
                                .frame(width: 6, height: 12)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
    }
}





struct TouristInformationView_Previews: PreviewProvider {
    static var previews: some View {
        TouristInformationView(addTouiristIsTapped: true)
    }
}
