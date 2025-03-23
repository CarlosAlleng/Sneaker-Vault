//
//  SneakersGrid.swift
//  The Sneaker Vault
//
//  Created by Carlos Alleng on 2025-03-17.
//

//import SwiftUI
//
//struct SneakersGrid: View {
//    let sneakers: [Sneaker]
//    @EnvironmentObject var shop: Shop
//    
//    // Filter sneakers based on the selected category
//    private var filteredSneakers: [Sneaker] {
//        if shop.selectedCategory == "All" {
//            return sneakers
//        } else {
//            // This is a simplified filter. In a real app,
//            // sneakers would have a category property to filter on
//            return sneakers
//        }
//    }
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text("TRENDING NOW")
//                .fontWeight(.bold)
//                .padding(.horizontal)
//            
//            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
//                ForEach(filteredSneakers) { sneaker in
//                    NavigationLink(destination: SneakerDetailView(sneaker: sneaker)) {
//                        SneakerCard(sneaker: sneaker)
//                    }
//                    .buttonStyle(PlainButtonStyle())
//                }
//            }
//            .padding()
//        }
//    }
//}


import SwiftUI

struct SneakersGrid: View {
    let sneakers: [Sneaker]
    @EnvironmentObject var shop: Shop
    
    // Filter sneakers based on the selected category
    private var filteredSneakers: [Sneaker] {
        if shop.selectedCategory == "All" {
            return sneakers
        } else {
            // This is a simplified filter. In a real app,
            // sneakers would have a category property to filter on
            return sneakers
        }
    }
    
    // For trending section, show all sneakers
    private var trendingSneakers: [Sneaker] {
        // Show all available sneakers in trending section
        return sneakers
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("TRENDING NOW")
                .fontWeight(.bold)
                .padding(.horizontal)
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(trendingSneakers) { sneaker in
                    NavigationLink(destination: SneakerDetailView(sneaker: sneaker)) {
                        SneakerCard(sneaker: sneaker)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding()
        }
    }
}
