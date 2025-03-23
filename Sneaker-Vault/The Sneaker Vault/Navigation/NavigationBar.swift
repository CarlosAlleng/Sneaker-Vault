//
//  NavigationBar.swift
//  The Sneaker Vault
//
//  Created by Carlos Alleng on 2025-03-17.
//

import SwiftUI

struct NavigationBar: View {
    @Binding var cartItems: Int
    
    var body: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "magnifyingglass")
                    .font(.title)
            }
            
            Spacer()
            
            HStack(spacing: 4) {
                Text("SNEAKER")
                    .fontWeight(.black)
                Circle()
                    .frame(width: 20, height: 20)
                Text("VAULT")
                    .fontWeight(.black)
            }
            
            Spacer()
            
            ZStack {
                Button(action: {}) {
                    Image(systemName: "cart")
                        .font(.title)
                }
                
                if cartItems > 0 {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 16, height: 16)
                        .overlay(
                            Text("\(cartItems)")
                                .font(.caption)
                                .foregroundColor(.white)
                        )
                }
            }
        }
        .padding()
        .background(Color.white)
    }
}
