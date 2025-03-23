//
//  FeaturedCarousel .swift
//  The Sneaker Vault
//
//  Created by Carlos Alleng on 2025-03-17.
//
import SwiftUI

struct FeaturedCarousel: View {
    let featuredSneakers: [FeaturedSneaker]
    
    // Array of background images to cycle through
    private let backgroundImages = ["featured_bg1", "featured_bg2", "featured_bg3"]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("FEATURED SNEAKERS")
                .fontWeight(.bold)
                .padding(.horizontal)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    if featuredSneakers.isEmpty {
                        // Fallback if no featured sneakers are found
                        FeaturedCard(
                            sneaker: FeaturedSneaker(
                                id: 0,
                                name: "Featured Sneaker",
                                image: "blue_sneaker",
                                alt: "New Release"
                            ),
                            backgroundImage: "featured_bg1"
                        )
                        .frame(width: UIScreen.main.bounds.width - 60)
                    } else {
                        // Display all featured sneakers from the array
                        ForEach(featuredSneakers, id: \.id) { sneaker in
                            FeaturedCard(
                                sneaker: sneaker,
                                backgroundImage: backgroundImages[Int(sneaker.id) % backgroundImages.count]
                            )
                            .frame(width: UIScreen.main.bounds.width - 60)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical, 10)
    }
}
