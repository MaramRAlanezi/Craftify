//
//  ActivityDetailsView.swift
//  Craftify
//
//  Created by Wejdan Alghamdi on 15/09/1446 AH.
//

import SwiftUI

struct ActivityDetailsView: View {
    
    let craft: Craft
    @State private var isFavorite = false
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                VStack( spacing: 16) {
                    
                    // Header Image
                    AsyncImage(url: URL(string: craft.imageURL)) { image in
                        image.resizable().scaledToFit().frame(height: 250).cornerRadius(10)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    
                    // Title
                    Text(craft.name)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(hue: 0.0, saturation: 0.0, brightness: 0.001, opacity: 0.66))
                        .padding()
                    
                    // Square Background
                    ZStack {
                        // Background Square
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(.offWhite))
                            .frame(width: 350)
                            .shadow(radius: 0.5)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            
                            // Supplies Section
                            VStack(alignment: .leading, spacing: 8) {
                                Text("🛠 Supplies")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(hue: 0.0, saturation: 0.0, brightness: 0.001, opacity: 0.66))
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(craft.supplies)
                                }
                                .foregroundColor(.gray)
                                .padding(.leading)
                                .font(.body)
                            }
                            
                            // Instructions Section
                            VStack(alignment: .leading, spacing: 8) {
                                Text("📖 Instructions")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(hue: 0.0, saturation: 0.0, brightness: 0.001, opacity: 0.66))
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(craft.instructions)
                                }
                                .foregroundColor(.gray)
                                .padding(.leading)
                                .font(.body)
                            }
                            
                            Spacer()
                        }
                        .padding()
                    }
                    .padding(.horizontal)
                }
                .padding()
                
            }//.navigationBarTitle("", displayMode: .inline) // Empty title
            .navigationBarItems(
                //                    leading: Button(action: {
                //                        // Back action (dismiss view)
                //                    }) {
                //                        Image(systemName: "chevron.left")
                //                            .foregroundColor(.black)
                //                            .fontWeight(.bold)
                //                    }.padding(15),
                trailing:
                    
                    Button(action: {
                        toggleFavorite()
                    }) {
                        HStack {
                            Image(systemName: isFavorite ? "heart.fill" : "heart")
                                .foregroundColor(isFavorite ? .pigOrange : .black)
                                .fontWeight(.bold)
//                            Text(isFavorite ? "Added to Favorites" : "Add to Favorites")
//                                .foregroundColor(.black)
                        }
                        .padding(15)
                        //.background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 2))
                    }
                
                
                
                
                
                //                        Button(action: {
                //                        // Heart action (e.g., save to favorites)
                //                    }) {
                //                        Image(systemName: "heart")
                //                            .foregroundColor(.black)
                //                            .fontWeight(.bold)
                //                    }.padding(15)
            )
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                isFavorite = isCraftFavorite()
            }
        }
    }
    
    
    
    func toggleFavorite() {
        var favorites = UserDefaults.standard.array(forKey: "favoriteCrafts") as? [[String: String]] ?? []
        
        if isFavorite {
            favorites.removeAll { $0["name"] == craft.name }
        } else {
            let craftData: [String: String] = [
                "name": craft.name,
                "imageURL": craft.imageURL,
                "supplies": craft.supplies,
                "instructions": craft.instructions
            ]
            favorites.append(craftData)
        }
        
        UserDefaults.standard.set(favorites, forKey: "favoriteCrafts")
        isFavorite.toggle()
    }
    
    // ✅ Check if a Craft is in Favorites
    func isCraftFavorite() -> Bool {
        let favorites = UserDefaults.standard.array(forKey: "favoriteCrafts") as? [[String: String]] ?? []
        return favorites.contains { $0["name"] == craft.name }
    }
    
}

//#Preview {
//    ActivityDetailsView(craft: craft)
//}
