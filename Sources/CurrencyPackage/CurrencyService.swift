//
//  File.swift
//  
//
//  Created by test on 04.09.2024.
//

import Foundation

public class CurrencyService {
    private let url = URL(string: "http://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/currency")!
    private let token = "ccf229a1b77f6fd04dd326b099025fc2db04cfe6"
    
    func fetchCurrencies(completion: @escaping (Result<[CurrencyDetails], Error>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("Token \(token)", forHTTPHeaderField: "Authorization")
        
        // Sending empty JSON body as request body
        request.httpBody = "{}".data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let currencyData = try JSONDecoder().decode(CurrencyData.self, from: data)
                let currencyDetails = currencyData.suggestions.map { $0.data }
                completion(.success(currencyDetails))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
