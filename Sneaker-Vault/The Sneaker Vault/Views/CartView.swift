
//  CartView.swift
//  The Sneaker Vault
//
//  Created by Carlos Alleng on 2025-03-21.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var shop: Shop
    
    var body: some View {
        NavigationView {
            VStack {
                if shop.cartContents.isEmpty {
                    VStack(spacing: 20) {
                        Image(systemName: "cart.badge.minus")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        
                        Text("Your Cart is Empty")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text("Items added to cart will appear here")
                            .foregroundColor(.secondary)
                        
                        .padding(.top, 10)
                    }
                    .padding()
                } else {
                    List {
                        ForEach(shop.cartContents.indices, id: \.self) { index in
                            HStack {
                                Image(shop.cartContents[index].sneaker.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                    .clipShape(Circle())
                                    .background(
                                        Circle()
                                            .fill(shop.cartContents[index].sneaker.colorValue.opacity(0.1))
                                            .padding(-5)
                                    )
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(shop.cartContents[index].sneaker.name)
                                        .fontWeight(.semibold)
                                    
                                    Text("Size: \(shop.cartContents[index].size)")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                    
                                    Text("\(shop.cartContents[index].sneaker.price) × \(shop.cartContents[index].quantity)")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    shop.removeFromCart(at: index)
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            }
                            .padding(.vertical, 5)
                        }
                        
                        Section {
                            HStack {
                                Text("Total")
                                    .fontWeight(.bold)
                                Spacer()
                                Text("$\(String(format: "%.2f", shop.calculateTotalPrice()))")
                                    .fontWeight(.bold)
                            }
                        }
                        
                        Section {
                            Button(action: {
                                // Checkout process
                            }) {
                                Text("CHECKOUT")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.blue.opacity(0.8))
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                }
            }
            .navigationTitle("Shopping Cart")
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(Shop())
    }
}
