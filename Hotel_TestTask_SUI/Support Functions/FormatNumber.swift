//
//  Extension + Struct.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 14.09.2023.
//

import Foundation
    func formatNumber(_ number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter.string(from: NSNumber(value: number)) ?? "\(number)"
}
