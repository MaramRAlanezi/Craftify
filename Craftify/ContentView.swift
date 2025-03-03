//
//  ContentView.swift
//  Craftify
//
//  Created by Maram Rabeh  on 28/02/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            SuppliesView()
                .tabItem {
                    Image(systemName: "paintbrush.fill")
                    Text("Supplies")
                }
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home Page")
                }
            FavoriteView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorites")
                }
            
        }
    }
}

#Preview {
    ContentView()
}
