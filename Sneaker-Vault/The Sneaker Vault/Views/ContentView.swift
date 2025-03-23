//
//  ContentView.swift
//  The Sneaker Vault
//
//  Created by Carlos Alleng on 2025-03-13.

//import SwiftUI

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var shop: Shop
    @State private var selectedTab = 0
    
    // Load data with safer approach
    private var categories: [Category] = DataManager.shared.load("categories.json")
    private var sneakers: [Sneaker] = DataManager.shared.load("sneakers.json")
    private var brands: [String] = DataManager.shared.load("brands.json")
    
    // For featured sneakers, load as array
    private var featuredSneakers: [FeaturedSneaker] = {
        // First try to load as array
        do {
            let data = try Data(contentsOf: Bundle.main.url(forResource: "featured", withExtension: "json")!)
            if let array = try? JSONDecoder().decode([FeaturedSneaker].self, from: data) {
                return array
            } else if let single = try? JSONDecoder().decode(FeaturedSneaker.self, from: data) {
                // If single object, convert to array
                return [single]
            }
            return []
        } catch {
            print("Error loading featured sneakers: \(error)")
            return []
        }
    }()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // Home Tab
            NavigationView {
                VStack(spacing: 0) {
                    NavigationBar(cartItems: $shop.cartItems)
                    
                    ScrollView {
                        SearchBar()
                        
                        // Use the carousel for multiple featured sneakers
                        FeaturedCarousel(featuredSneakers: featuredSneakers)
                        
                        CategoriesView(categories: categories, selectedCategory: $shop.selectedCategory)
                        SneakersGrid(sneakers: sneakers)
                        BrandsView(brands: brands)
                    }
                }
                .background(Color(.systemGray6))
                .navigationBarHidden(true)
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            .tag(0)
            
            // Favorites Tab
            FavoritesView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
                .tag(1)
            
            // Cart Tab
            CartView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Cart")
                }
                .tag(2)
            
            // Profile Tab
            Text("User Profile")
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(3)
        }
        .accentColor(.black)
    }
}

// Preview Provider
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Shop())
    }
}
