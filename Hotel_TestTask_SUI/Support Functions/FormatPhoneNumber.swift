//
//  FormatPhoneNumber.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 16.09.2023.
//

import Foundation

// Функция для форматирования номера телефона
func formatPhoneNumber(_ phoneNumber: String) -> String {
    var formattedPhoneNumber = phoneNumber.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)

    if formattedPhoneNumber.hasPrefix("7") || formattedPhoneNumber.hasPrefix("8") {
        formattedPhoneNumber.removeFirst()
    }

    // Обрезаем номер до 10 цифр
    if formattedPhoneNumber.count > 10 {
        formattedPhoneNumber = String(formattedPhoneNumber.prefix(10))
    }

    // Создаем маску
    var maskedPhoneNumber = "+7 (***) ***-**-**"

    // Преобразуем строку с номером в массив символов
    let phoneNumberArray = Array(formattedPhoneNumber)

    // Заменяем звездочки на цифры из введенного номера
    for (_, digit) in phoneNumberArray.enumerated() {
        if let range = maskedPhoneNumber.range(of: "*") {
            let startIndex = range.lowerBound
            let endIndex = range.upperBound
            if startIndex < maskedPhoneNumber.endIndex && endIndex <= maskedPhoneNumber.endIndex {
                let replacementRange = startIndex..<endIndex
                maskedPhoneNumber.replaceSubrange(replacementRange, with: String(digit))
            }
        } else {
            break
        }
    }

    return maskedPhoneNumber
}





