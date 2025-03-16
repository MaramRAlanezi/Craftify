//
//  FavoriteView.swift
//  Craftify
//
//  Created by Wejdan Alghamdi on 04/09/1446 AH.
//

import SwiftUI

struct FavoriteView: View {
    
    @State private var favoriteCrafts: [Craft] = []
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color.background
                
            VStack {
                
                if favoriteCrafts.isEmpty {
                    Text("No favorites yet! 🧡")
                        .font(.custom("Poppins-Regular", size: 22))
                        .foregroundColor(.darkGray)
                } else {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                            ForEach(favoriteCrafts) { craft in
                                NavigationLink(destination: ActivityDetailsView(craft: craft)) {
                                    VStack {
                                        AsyncImage(url: URL(string: craft.imageURL)) { image in
                                            image.resizable().scaledToFit().frame(height: 150).cornerRadius(10)
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        
                                        Text(craft.name)
                                            .font(.headline)
                                            .foregroundColor(.black)
                                            .frame(maxWidth: .infinity)
                                            .padding(.vertical, 8)
                                            .background(Color.white)
                                            .cornerRadius(10)
                                    }
                                    .frame(width: 160)
                                    .background(Color.white)
                                    .cornerRadius(15)
                                    .shadow(radius: 5)
                                }
                            }
                        }
                        .padding()
                    }
                }
            }}
            .onAppear {
                loadFavorites()
            }
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Favorites")
                        .font(.custom("Poppins-Bold", size: 22)) // Custom font and size
                        .foregroundColor(.black) // Optional: Custom color
                }
                
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.background, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            
            
        }.navigationBarBackButtonHidden(true)
    }
    
    // ✅ Load Saved Favorites
    func loadFavorites() {
        let favorites = UserDefaults.standard.array(forKey: "favoriteCrafts") as? [[String: String]] ?? []
        favoriteCrafts = favorites.map { craftData in
            Craft(
                name: craftData["name"] ?? "Unknown Craft",
                imageURL: craftData["imageURL"] ?? "",
                supplies: craftData["supplies"] ?? "",
                instructions: craftData["instructions"] ?? ""
            )
        }
    }
}

#Preview {
    FavoriteView()
}
