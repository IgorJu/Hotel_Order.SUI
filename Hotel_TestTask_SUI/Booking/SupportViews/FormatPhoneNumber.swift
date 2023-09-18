//
//  FormatPhoneNumber.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 18.09.2023.
//

import Foundation

func format(phoneNumber: String, shouldRemoveLastDigit: Bool) -> String {
        guard !(shouldRemoveLastDigit && phoneNumber.count <= 2) else { return "+" }
        
    guard let regex = try? NSRegularExpression(pattern: "[\\+\\s-\\(\\)]", options: .caseInsensitive) else {
        return ""
    }
        let maxNumberCount = 11

        
        let range = NSString(string: phoneNumber).range(of: phoneNumber)
        var number = regex.stringByReplacingMatches(in: phoneNumber, options: [], range: range, withTemplate: "")
        
        if number.count > maxNumberCount {
            let maxIndex = number.index(number.startIndex, offsetBy: maxNumberCount)
            number = String(number[number.startIndex..<maxIndex])
        }
        
        if shouldRemoveLastDigit {
            let maxIndex = number.index(number.startIndex, offsetBy: number.count - 1)
            number = String(number[number.startIndex..<maxIndex])
        }
        
        let maxIndex = number.index(number.startIndex, offsetBy: number.count)
        let regRange = number.startIndex..<maxIndex
        
        if number.count < 7 {
            let pattern = "(\\d)(\\d{3})(\\d+)"
            number = number.replacingOccurrences(of: pattern, with: "$1 ($2) $3", options: .regularExpression, range: regRange)
        } else {
            let pattern = "(\\d)(\\d{3})(\\d{3})(\\d{2})(\\d+)"
            number = number.replacingOccurrences(of: pattern, with: "$1 ($2) $3-$4-$5", options: .regularExpression, range: regRange)
        }
        
        return "+" + number
    }

func formatPhoneNumber(_ number: String) -> String {
        let cleanedNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        var formattedNumber = "+7"
        
        for (index, digit) in cleanedNumber.enumerated() {
            if index == 0 {
                formattedNumber += " (\(digit)"
            } else if index == 3 {
                formattedNumber += ") \(digit)"
            } else if index == 6 {
                formattedNumber += "-\(digit)"
            } else if index == 8 {
                formattedNumber += "-\(digit)"
            } else {
                formattedNumber += "\(digit)"
            }
        }
        
        return formattedNumber
    }



