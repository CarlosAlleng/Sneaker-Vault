//
//  DataModels.swift
//  The Sneaker Vault
//
//  Created by Carlos Alleng on 2025-03-17.
//

import SwiftUI

struct Category: Identifiable, Codable {
    let id: Int
    let name: String
    let icon: String
}

struct Sneaker: Identifiable, Codable {
    let id: Int
    let name: String
    let price: String
    let image: String
    let color: String
    
    var colorValue: Color {
        switch color {
        case "blue": return .blue
        case "yellow": return .yellow
        default: return .gray
        }
    }
}

struct FeaturedSneaker: Codable {
    let id: Int
    let name: String
    let image: String
    let alt: String
}
