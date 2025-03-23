//
//  neakerDetailView.swift
//  The Sneaker Vault
//
//  Created by Carlos Alleng on 2025-03-17.
//

//import SwiftUI
//
//struct SneakerDetailView: View {
//    let sneaker: Sneaker
//    @Environment(\.presentationMode) var presentationMode
//    @EnvironmentObject var shop: Shop
//    @State private var imageOffset: CGFloat = 200
//    @State private var priceOpacity: Double = 0
//    @State private var quantityCount: Int = 1
//    @State private var selectedSize: String = "8"
//    
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 0) {
//                // Header with back button and cart
//                HStack {
//                    Button(action: {
//                        presentationMode.wrappedValue.dismiss()
//                    }) {
//                        Image(systemName: "chevron.left")
//                            .font(.title3)
//                            .foregroundColor(.primary)
//                    }
//                    
//                    Spacer()
//                    
//                    Text("Sneaker Vault")
//                        .font(.caption)
//                        .fontWeight(.semibold)
//                    
//                    Spacer()
//                    
//                    Button(action: {}) {
//                        Image(systemName: "cart")
//                            .font(.title3)
//                    }
//                }
//                .padding(.horizontal)
//                .padding(.top, 10)
//                
//                // Category label
//                Text("Premium Sneakers")
//                    .font(.caption)
//                    .padding(.horizontal)
//                    .padding(.top, 20)
//                
//                // Product name
//                Text(sneaker.name)
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .padding(.horizontal)
//                
//                // Main product showcase with animated image and price
//                ZStack {
//                    // Background color matching the sneaker's color
//                    RoundedRectangle(cornerRadius: 0)
//                        .fill(sneaker.colorValue.opacity(0.15))
//                        .frame(height: 300)
//                    
//                    // Price with animation
//                    VStack(alignment: .leading) {
//                        Text("Price")
//                            .font(.caption)
//                            .padding(.bottom, -5)
//                        
//                        Text(sneaker.price)
//                            .font(.title)
//                            .fontWeight(.black)
//                    }
//                    .opacity(priceOpacity)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.leading, 20)
//                    .offset(y: -90)
//                    
//                    // Product image with animation
//                    Image(sneaker.image)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(height: 220)
//                        .clipShape(Circle())
//                        .background(
//                            Circle()
//                                .fill(Color.white)
//                                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
//                        )
//                        .offset(x: imageOffset)
//                }
//                .padding(.top, 20)
//                
//                // Ratings
//                HStack {
//                    Text("Ratings")
//                        .font(.caption)
//                    
//                    ForEach(0..<5) { star in
//                        Image(systemName: "star.fill")
//                            .foregroundColor(star < 4 ? .yellow : .gray)
//                            .font(.caption)
//                    }
//                    
//                    Spacer()
//                    
//                    Text("Sizes")
//                        .font(.caption)
//                }
//                .padding(.horizontal)
//                .padding(.top, 20)
//                
//                // Size selection
//                HStack {
//                    ForEach(["6", "7", "8", "9", "10"], id: \.self) { size in
//                        Button(action: {
//                            selectedSize = size
//                        }) {
//                            Text(size)
//                                .font(.footnote)
//                                .fontWeight(.medium)
//                                .frame(width: 30, height: 30)
//                                .background(
//                                    RoundedRectangle(cornerRadius: 5)
//                                        .stroke(selectedSize == size ? Color.blue : Color.gray.opacity(0.3), lineWidth: selectedSize == size ? 2 : 1)
//                                )
//                                .foregroundColor(selectedSize == size ? .blue : .primary)
//                        }
//                    }
//                }
//                .padding(.horizontal)
//                .padding(.top, 5)
//                
//                // Product description
//                Text("\(sneaker.name). The sneaker is designed for both performance and style. It features a comfortable cushioned insole, durable outsole, and breathable upper material. Premium materials ensure longevity and the unique design makes it a perfect addition to any collection. Sneakers are essential for athletes and casual wearers alike.")
//                    .font(.footnote)
//                    .foregroundColor(.secondary)
//                    .padding(.horizontal)
//                    .padding(.top, 20)
//                
//                // Quantity selector
//                HStack {
//                    Button(action: {
//                        if quantityCount > 1 {
//                            quantityCount -= 1
//                        }
//                    }) {
//                        Circle()
//                            .stroke(Color.gray, lineWidth: 1)
//                            .frame(width: 35, height: 35)
//                            .overlay(
//                                Image(systemName: "minus")
//                                    .foregroundColor(.black)
//                            )
//                    }
//                    
//                    Text("\(quantityCount)")
//                        .frame(width: 35, height: 35)
//                    
//                    Button(action: {
//                        quantityCount += 1
//                    }) {
//                        Circle()
//                            .stroke(Color.gray, lineWidth: 1)
//                            .frame(width: 35, height: 35)
//                            .overlay(
//                                Image(systemName: "plus")
//                                    .foregroundColor(.black)
//                            )
//                    }
//                    
//                    Spacer()
//                    
//                    Button(action: {
//                        if shop.isFavorite(sneaker) {
//                            shop.removeFromFavorites(sneaker)
//                        } else {
//                            shop.addToFavorites(sneaker)
//                        }
//                    }) {
//                        Circle()
//                            .fill(Color.red.opacity(0.1))
//                            .frame(width: 40, height: 40)
//                            .overlay(
//                                Image(systemName: shop.isFavorite(sneaker) ? "heart.fill" : "heart")
//                                    .foregroundColor(.red)
//                            )
//                    }
//                }
//                .padding(.horizontal)
//                .padding(.top, 25)
//                
//                // Add to cart button
//                Button(action: {
//                    shop.addToCart(sneaker: sneaker, size: selectedSize, quantity: quantityCount)
//                }) {
//                    Text("ADD TO CART")
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color.blue.opacity(0.8))
//                        .cornerRadius(15)
//                }
//                .padding()
//                .padding(.top, 10)
//            }
//        }
//        .navigationBarHidden(true)
//        .onAppear {
//            // Animate sneaker image sliding in
//            withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0)) {
//                imageOffset = 0
//            }
//            
//            // Animate price fading in with delay
//            withAnimation(.easeIn.delay(0.3)) {
//                priceOpacity = 1
//            }
//        }
//    }
//}
//
//// Preview provider
//struct SneakerDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        SneakerDetailView(
//            sneaker: Sneaker(
//                id: 1,
//                name: "Nike Air Max",
//                price: "$199",
//                image: "blue_sneaker",
//                color: "blue"
//            )
//        )
//        .environmentObject(Shop())
//    }
//}


import SwiftUI

struct SneakerDetailView: View {
    let sneaker: Sneaker
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var shop: Shop
    @State private var imageOffset: CGFloat = 200
    @State private var priceOpacity: Double = 0
    @State private var quantityCount: Int = 1
    @State private var selectedSize: String = "8"
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // Header with back button and cart
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title3)
                            .foregroundColor(.primary)
                    }
                    
                    Spacer()
                    
                    Text("Sneaker Vault")
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "cart")
                            .font(.title3)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                // Category label
                Text("Premium Sneakers")
                    .font(.caption)
                    .padding(.horizontal)
                    .padding(.top, 20)
                
                // Product name
                Text(sneaker.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                // Main product showcase with animated image and price
                ZStack {
                    // Background color matching the sneaker's color
                    RoundedRectangle(cornerRadius: 0)
                        .fill(sneaker.colorValue.opacity(0.15))
                        .frame(height: 300)
                    
                    // Price with animation
                    VStack(alignment: .leading) {
                        Text("Price")
                            .font(.caption)
                            .padding(.bottom, -5)
                        
                        Text(sneaker.price)
                            .font(.title)
                            .fontWeight(.black)
                    }
                    .opacity(priceOpacity)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                    .offset(y: -90)
                    
                    // Product image with animation
                    Image(sneaker.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 220)
                        .clipShape(Circle())
                        .background(
                            Circle()
                                .fill(Color.white)
                                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                        )
                        .offset(x: imageOffset)
                }
                .padding(.top, 20)
                
                // Ratings
                HStack {
                    Text("Ratings")
                        .font(.caption)
                    
                    ForEach(0..<5) { star in
                        Image(systemName: "star.fill")
                            .foregroundColor(star < 4 ? .yellow : .gray)
                            .font(.caption)
                    }
                    
                    Spacer()
                    
                    Text("Sizes")
                        .font(.caption)
                }
                .padding(.horizontal)
                .padding(.top, 20)
                
                // Size selection
                HStack {
                    ForEach(["6", "7", "8", "9", "10"], id: \.self) { size in
                        Button(action: {
                            selectedSize = size
                        }) {
                            Text(size)
                                .font(.footnote)
                                .fontWeight(.medium)
                                .frame(width: 30, height: 30)
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(selectedSize == size ? Color.blue : Color.gray.opacity(0.3), lineWidth: selectedSize == size ? 2 : 1)
                                )
                                .foregroundColor(selectedSize == size ? .blue : .primary)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 5)
                
                // Product description
                Text("\(sneaker.name). The sneaker is designed for both performance and style. It features a comfortable cushioned insole, durable outsole, and breathable upper material. Premium materials ensure longevity and the unique design makes it a perfect addition to any collection. Sneakers are essential for athletes and casual wearers alike.")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                    .padding(.top, 20)
                
                // Quantity selector
                HStack {
                    Button(action: {
                        if quantityCount > 1 {
                            quantityCount -= 1
                        }
                    }) {
                        Circle()
                            .stroke(Color.gray, lineWidth: 1)
                            .frame(width: 35, height: 35)
                            .overlay(
                                Image(systemName: "minus")
                                    .foregroundColor(.black)
                            )
                    }
                    
                    Text("\(quantityCount)")
                        .frame(width: 35, height: 35)
                    
                    Button(action: {
                        quantityCount += 1
                    }) {
                        Circle()
                            .stroke(Color.gray, lineWidth: 1)
                            .frame(width: 35, height: 35)
                            .overlay(
                                Image(systemName: "plus")
                                    .foregroundColor(.black)
                            )
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        if shop.isFavorite(sneaker) {
                            shop.removeFromFavorites(sneaker)
                        } else {
                            shop.addToFavorites(sneaker)
                        }
                    }) {
                        Circle()
                            .fill(Color.red.opacity(0.1))
                            .frame(width: 40, height: 40)
                            .overlay(
                                Image(systemName: shop.isFavorite(sneaker) ? "heart.fill" : "heart")
                                    .foregroundColor(.red)
                            )
                    }
                }
                .padding(.horizontal)
                .padding(.top, 25)
                
                // Add to cart button
                Button(action: {
                    shop.addToCart(sneaker: sneaker, size: selectedSize, quantity: quantityCount)
                    // Show confirmation feedback
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                }) {
                    Text("ADD TO CART")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue.opacity(0.8))
                        .cornerRadius(15)
                }
                .padding()
                .padding(.top, 10)
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            // Animate sneaker image sliding in
            withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0)) {
                imageOffset = 0
            }
            
            // Animate price fading in with delay
            withAnimation(.easeIn.delay(0.3)) {
                priceOpacity = 1
            }
        }
    }
}

// Preview provider
struct SneakerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SneakerDetailView(
            sneaker: Sneaker(
                id: 1,
                name: "Nike Air Max",
                price: "$199",
                image: "blue_sneaker",
                color: "blue"
            )
        )
        .environmentObject(Shop())
    }
}
