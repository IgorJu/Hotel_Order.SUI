//
//  BookingView.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 14.09.2023.
//

import SwiftUI

struct BookingView: View {
    
    @State private var phoneNumber = ""
    @State private var email = ""
    @State private var maskedPhoneNumber = "+7 (***) ***-**-**"
    
    @StateObject private var viewModel = BookingViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                VStack.init(alignment: .leading, spacing: 15) {
                    DivideLine(lineWidth: 7)
                        .frame(height: 10)
                    
                    //MARK: - Рейтинг, название, адрес
                    if let rating = viewModel.booking?.horating,
                       let ratingName = viewModel.booking?.ratingName {
                        RatingView(rating: rating, ratingName: ratingName)
                    }
                    
                    if let hotelName = viewModel.booking?.hotelName {
                        fontSFPro(text: hotelName, size: 22)
                            .bold()
                    }
                    
                    if let address = viewModel.booking?.hotelAdress {
                        Button {
                            
                        } label: {
                            fontSFPro(text: address, size: 14)
                                .bold()
                        }
                        
                    }
                }
                //divide line
                DivideLine(lineWidth: 7)
                    .frame(height: 10)
                    .padding(.top, 10)
                //MARK: - Информация о путешествии
                if let departure = viewModel.booking?.departure,
                   let arrival = viewModel.booking?.arrivalCountry,
                   let dateStart = viewModel.booking?.tourDateStart,
                   let dateStop = viewModel.booking?.tourDateStop,
                   let countOfNights = viewModel.booking?.numberOfNights,
                   let hotelName = viewModel.booking?.hotelName,
                   let roomName = viewModel.booking?.room,
                   let food = viewModel.booking?.nutrition {
                    TripInformationView(
                        departure: departure,
                        arrival: arrival,
                        dateStart: dateStart,
                        dateStop: dateStop,
                        countOfNights: countOfNights,
                        hotel: hotelName,
                        roomName: roomName,
                        food: food
                    )
                }
                //divide line
                DivideLine(lineWidth: 7)
                    .frame(height: 10)
                //MARK: - Информация о покупателе
                InfoCustomerView(phoneNumber: phoneNumber, email: email)
                DivideLine(lineWidth: 7)
                    .frame(height: 10)
                    .padding(.top, 5)
                
                //MARK: - Турист и текоствые поля
                TouristInformationView()
                DivideLine(lineWidth: 7)
                    .frame(height: 10)
                
                //MARK: - Итоговая цена
                FinalPriceView(
                    tourPrice: viewModel.booking?.tourPrice ?? 0,
                    fuelCharge: viewModel.booking?.fuelCharge ?? 0,
                    serviceCharge: viewModel.booking?.serviceCharge ?? 0
                )
                .padding(.top, 10)
                        
                
            }
            .padding()
            .navigationBarBackButtonHidden(true)
            .toolbar {
                CustomBackButton(text: "Бронирование")
            }
            .task {
                await viewModel.fetchBooking()
            }
        }
            
        
    }
}
    
    struct BookingView_Previews: PreviewProvider {
        static var previews: some View {
            BookingView()
        }
    }
