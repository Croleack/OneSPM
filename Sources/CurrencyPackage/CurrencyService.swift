//
//  File.swift
//  
//
//  Created by test on 04.09.2024.
//

import Foundation

public class CurrencyService {
    
    public init() { }
    
    private let urlString = "https://api.ipify.org?format=json"
    
    public func fetchIP() async throws -> String {
        guard let url = URL(string: urlString) else {
            throw NSError(domain: "Invalid URL", code: -1, userInfo: nil)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let ipResponse = try JSONDecoder().decode(IPResponse.self, from: data)
        
        return ipResponse.ip
    }
}
