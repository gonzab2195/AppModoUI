//
//  StringUtils.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 23/01/2024.
//

import Foundation

func formatAmount(_ amount: String) -> String {
    if let amountDouble = Double(amount) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        if let formattedAmount = numberFormatter.string(from: NSNumber(value: amountDouble)) {
            return formattedAmount
        }
    }
    return amount
}

func getRoundedAmount(_ amount: Float) -> String {
    let parteEntera = Int(amount)
    return formatAmount(String(parteEntera))
}

func getDecimalAmount(_ amount: Float) -> String {
    let parteDecimal = amount - Float(Int(amount))
    return String(String(format: "%.2f", parteDecimal).split(separator: ".")[1])
}

func encodeClass(clase: Encodable) -> String? {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted

    do {
        let jsonData = try encoder.encode(clase)
        if let jsonString = String(data: jsonData, encoding: .utf8) {
            return jsonString
        } else {
            return nil
        }
    } catch {
        print("Error al encodear la clase: \(error)")
        return nil
    }
}
