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
