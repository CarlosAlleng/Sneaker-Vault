//
//  FavoritesView.swift
//  The Sneaker Vault
//
//  Created by Carlos Alleng on 2025-03-20.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var shop: Shop
    
    var body: some View {
        NavigationView {
            VStack {
                if shop.favoriteItems.isEmpty {
                    VStack(spacing: 20) {
                        Image(systemName: "heart.slash")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        
                        Text("No Favorites Yet")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text("Items you like will appear here")
                            .foregroundColor(.secondary)
    
                        .padding(.top, 10)
                    }
                    .padding()
                } else {
                    List {
                        ForEach(shop.favoriteItems) { sneaker in
                            NavigationLink(destination: SneakerDetailView(sneaker: sneaker)) {
                                HStack {
                                    Image(sneaker.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 70, height: 70)
                                        .clipShape(Circle())
                                        .background(
                                            Circle()
                                                .fill(sneaker.colorValue.opacity(0.1))
                                                .padding(-5)
                                        )
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(sneaker.name)
                                            .fontWeight(.semibold)
                                        
                                        Text(sneaker.price)
                                            .foregroundColor(.secondary)
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                }
                                .padding(.vertical, 5)
                            }
                        }
                        .onDelete(perform: removeFavorites)
                    }
                    .listStyle(InsetGroupedListStyle())
                }
            }
            .navigationTitle("Favorites")
            .navigationBarItems(trailing:
                shop.favoriteItems.isEmpty ? nil :
                    EditButton()
                        .foregroundColor(.blue)
            )
        }
    }
    
    func removeFavorites(at offsets: IndexSet) {
        for index in offsets {
            shop.removeFromFavorites(shop.favoriteItems[index])
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(Shop())
    }
}
