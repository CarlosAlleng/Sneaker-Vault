//
//  FeaturedCard.swift
//  The Sneaker Vault
//
//  Created by Carlos Alleng on 2025-03-17.
//

import SwiftUI

struct FeaturedCard: View {
    let sneaker: FeaturedSneaker
    let backgroundImage: String
    
    // Initialize with default background if none provided
    init(sneaker: FeaturedSneaker, backgroundImage: String = "featured_bg1") {
        self.sneaker = sneaker
        self.backgroundImage = backgroundImage
    }
    
    var body: some View {
        ZStack {
            // Background with gradient overlay
            if UIImage(named: backgroundImage) != nil {
                Image(backgroundImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.black.opacity(0.6), Color.black.opacity(0.3)]),
                            startPoint: .bottomLeading,
                            endPoint: .topTrailing
                        )
                    )
            } else {
                // Fallback gradient if image not found
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 0.1, green: 0.1, blue: 0.3),
                        Color(red: 0.2, green: 0.2, blue: 0.5)
                    ]),
                    startPoint: .bottomLeading,
                    endPoint: .topTrailing
                )
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("FEATURED")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color.orange)
                    .cornerRadius(5)
                
                Spacer()
                
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(sneaker.name)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.3), radius: 2, x: 1, y: 1)
                        
                        Text(sneaker.alt)
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.8))
                            .shadow(color: .black.opacity(0.3), radius: 1, x: 1, y: 1)
                    }
                    
                    Spacer()
                    
                    Image(sneaker.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 120)
                        .rotationEffect(.degrees(-15))
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 5)
                }
            }
            .padding()
        }
        .frame(height: 200)
        .cornerRadius(15)
        .clipped()
    }
}
