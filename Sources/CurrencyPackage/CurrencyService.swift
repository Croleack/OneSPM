//
//  File.swift
//  
//
//  Created by test on 04.09.2024.
//

import Foundation

public class CurrencyService {
    private let urlString = "https://api.ipify.org?format=json"

    func fetchIP(completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "DataError", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let ipResponse = try JSONDecoder().decode(IPResponse.self, from: data)
                completion(.success(ipResponse.ip))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}

// MARK: - IPResponse
struct IPResponse: Codable {
    let ip: String
}
