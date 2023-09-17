//
//  NubmerInRussian.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 17.09.2023.
//

import Foundation

func numberInRussian(_ number: Int) -> String {
    switch number {
    case 1:
        return "Первый"
    case 2:
        return "Второй"
    case 3:
        return "Третий"
        // Добавьте другие случаи по мере необходимости
    default:
        return "\(number)ый"
    }
}
