//
//  NetworkManager.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 09.09.2023.
//

import SwiftUI

enum API: String {
    case hotelURL = "https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3"
    
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init () {}
    
    //MARK: - Fetch Methods
    func fetchHotel() async throws -> Hotel {
        guard let url = URL(string: API.hotelURL.rawValue) else {
            throw NetworkError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let hotel = try? decoder.decode(Hotel.self, from: data) else {
            throw NetworkError.decodingError
        }
        return hotel
    }
}