//
//  DataManager.swift
//  The Sneaker Vault
//
//  Created by Carlos Alleng on 2025-03-17.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    func load<T: Decodable>(_ filename: String) -> T {
        guard let file = Bundle.main.url(forResource: filename.components(separatedBy: ".").first,
                                        withExtension: filename.contains(".") ? filename.components(separatedBy: ".").last : "json"),
              let data = try? Data(contentsOf: file) else {
            fatalError("Couldn't load \(filename)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            print("Error decoding \(filename): \(error)")
            fatalError("Failed to decode \(filename): \(error)")
        }
    }
}
