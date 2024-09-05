//
//  File.swift
//  
//
//  Created by test on 05.09.2024.
//

import Foundation

// MARK: - IPResponse
struct IPResponse: Codable {
    let ip: String
}
// MARK: - IPManager
actor IPManager {
    private var ip: String = ""
    
    func updateIP(_ newIP: String) {
        ip = newIP
    }
    
    func getIP() -> String {
        return ip
    }
}
