//
//  Shop.swift
//  The Sneaker Vault
//
//  Created by Carlos Alleng on 2025-03-17.
//


import SwiftUI

class Shop: ObservableObject {
    @Published var cartItems = 0
    @Published var selectedCategory = "All"
    @Published var favoriteItems: [Sneaker] = []
    @Published var cartContents: [(sneaker: Sneaker, size: String, quantity: Int)] = []
    
    // Check if a sneaker is in favorites
    func isFavorite(_ sneaker: Sneaker) -> Bool {
        return favoriteItems.contains(where: { $0.id == sneaker.id })
    }
    
    // Add sneaker to favorites
    func addToFavorites(_ sneaker: Sneaker) {
        if !isFavorite(sneaker) {
            favoriteItems.append(sneaker)
        }
    }
    
    // Remove sneaker from favorites
    func removeFromFavorites(_ sneaker: Sneaker) {
        favoriteItems.removeAll(where: { $0.id == sneaker.id })
    }
    
    // Add sneaker to cart
    func addToCart(sneaker: Sneaker, size: String, quantity: Int) {
        cartContents.append((sneaker: sneaker, size: size, quantity: quantity))
        cartItems += quantity
    }
    
    // Remove sneaker from cart
    func removeFromCart(at index: Int) {
        if index < cartContents.count {
            cartItems -= cartContents[index].quantity
            cartContents.remove(at: index)
        }
    }
    
    // Calculate total price
    func calculateTotalPrice() -> Double {
        var total: Double = 0
        
        for item in cartContents {
            let priceString = item.sneaker.price
            // Extract numeric value from price string (removing $ and any other characters)
            if let price = Double(priceString.replacingOccurrences(of: "$", with: "").trimmingCharacters(in: .whitespaces)) {
                total += price * Double(item.quantity)
            }
        }
        
        return total
    }
}
