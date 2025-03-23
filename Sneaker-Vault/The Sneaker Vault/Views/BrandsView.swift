//
//  BrandsView.swift
//  The Sneaker Vault
//
//  Created by Carlos Alleng on 2025-03-17.
//

import SwiftUI

struct BrandsView: View {
    let brands: [String]
    
    // Dictionary mapping brand names to their logo image names
    private let brandLogos = [
        "Nike": "nike_logo",
        "Adidas": "adidas_logo",
        "New Balance": "newbalance_logo",
        "Puma": "puma_logo",
        "Reebok": "reebok_logo"
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("TOP BRANDS")
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(brands, id: \.self) { brand in
                        BrandCard(name: brand, imageName: brandLogos[brand] ?? "")
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
        .padding(.top)
    }
}

struct BrandCard: View {
    let name: String
    let imageName: String
    
    // Fixed dimensions for consistency
    private let circleSize: CGFloat = 70
    private let imageSize: CGFloat = 50
    
    var body: some View {
        VStack(spacing: 8) {
            // Brand logo container
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: circleSize, height: circleSize)
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                
                if !imageName.isEmpty, UIImage(named: imageName) != nil {
                    // If we have a valid image, display it
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: imageSize, height: imageSize)
                        // Apply clipping if needed for some logos
                        // .clipShape(Circle())
                } else {
                    // Fallback to the first letter if no image is available
                    Text(String(name.prefix(1)))
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
            
            Text(name)
                .font(.caption)
                .fontWeight(.medium)
        }
        .frame(width: 80)
    }
}
