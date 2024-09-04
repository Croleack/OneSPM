//
//  File.swift
//  
//
//  Created by test on 04.09.2024.
//

import Foundation

// MARK: - CurrencyData
struct CurrencyData: Codable {
    let suggestions: [CurrencySuggestion]
}

// MARK: - CurrencySuggestion
struct CurrencySuggestion: Codable {
    let value: String
    let unrestrictedValue: String
    let data: CurrencyDetails
    
    enum CodingKeys: String, CodingKey {
        case value, unrestrictedValue = "unrestricted_value", data
    }
}

// MARK: - CurrencyDetails
struct CurrencyDetails: Codable {
    let code: String
    let strcode: String
    let name: String
    let country: String
}
