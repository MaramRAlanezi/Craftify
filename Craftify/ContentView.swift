//
//  ContentView.swift
//  Craftify
//
//  Created by Maram Rabeh  on 28/02/2025.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        //NavigationView{
            
            TabView{
               
                HomepageView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
          
                    }
                
                    SuppliesView()
                        .tabItem {
                            Image(systemName: "paintbrush.fill")
                            Text("Supplies")
                        }
                    
                    FavoriteView()
                        .tabItem {
                            Image(systemName: "heart.fill")
                            Text("Favorites")
                        }
         
            }.accentColor(.pigOrange)
            
//        }.navigationBarBackButtonHidden(true)
//            .accentColor(Color.pigOrange)
        
    }
}

#Preview {
    ContentView()
}
