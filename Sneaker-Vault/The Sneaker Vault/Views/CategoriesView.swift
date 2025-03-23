//
//  CategoriesView.swift
//  The Sneaker Vault
//
//  Created by Carlos Alleng on 2025-03-17.
//

import SwiftUI

struct CategoriesView: View {
    let categories: [Category]
    @Binding var selectedCategory: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("CATEGORIES")
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    CategoryButton(title: "All", icon: "🔍", isSelected: selectedCategory == "All") {
                        selectedCategory = "All"
                    }
                    
                    ForEach(categories) { category in
                        CategoryButton(title: category.name, icon: category.icon, isSelected: selectedCategory == category.name) {
                            selectedCategory = category.name
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
    }
}

struct CategoryButton: View {
    let title: String
    let icon: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(icon)
                    .font(.title2)
                
                Text(title)
                    .fontWeight(.semibold)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(isSelected ? Color.black : Color.white)
            .foregroundColor(isSelected ? .white : .black)
            .cornerRadius(10)
        }
    }
}
