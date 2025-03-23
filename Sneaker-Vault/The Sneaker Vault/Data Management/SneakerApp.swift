//
//  The_Sneaker_VaultApp.swift
//  The Sneaker Vault
//
//  Created by Carlos Alleng on 2025-03-13.
//

import SwiftUI

@main
struct SneakerApp: App {
    @StateObject private var shop = Shop()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(shop)
        }
    }
}
