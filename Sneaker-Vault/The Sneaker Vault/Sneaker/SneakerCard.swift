//
//  SneakerCard.swift
//  The Sneaker Vault
//
//  Created by Carlos Alleng on 2025-03-21.
//

import SwiftUI

struct SneakerCard: View {
    let sneaker: Sneaker
    @EnvironmentObject var shop: Shop
    
    var body: some View {
        VStack {
            ZStack {
                // Card background
                Rectangle()
                    .fill(Color.white)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                
                VStack(spacing: 0) {
                    // Sneaker image - taking most of the card space
                    ZStack(alignment: .topTrailing) {
                        Image(sneaker.image)
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .frame(height: 140)
                        
                        // Favorite button
                        Button(action: {
                            if shop.isFavorite(sneaker) {
                                shop.removeFromFavorites(sneaker)
                            } else {
                                shop.addToFavorites(sneaker)
                            }
                        }) {
                            Image(systemName: shop.isFavorite(sneaker) ? "heart.fill" : "heart")
                                .foregroundColor(.red)
                                .padding(8)
                                .background(Circle().fill(Color.white.opacity(0.8)))
                                .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
                        }
                        .padding(8)
                    }
                    
                    // Product info section
                    VStack(alignment: .leading, spacing: 4) {
                        Text(sneaker.name)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        Text(sneaker.price)
                            .foregroundColor(.primary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 12)
                    .padding(.bottom, 12)
                }
            }
            .frame(height: 200)
            .cornerRadius(12)
        }
    }
}
