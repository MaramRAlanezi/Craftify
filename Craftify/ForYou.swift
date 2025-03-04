//
//  Homepage.swift
//  Craftify
//
//  Created by Maram Rabeh  on 04/03/2025.
//


import SwiftUI

struct ForYou: View {
    @State private var selectedTab: String = "Home"
    @State private var path: [String] = []
    
    let activities = ["P1", "P2", "P3", "P4", "P5", "P6"] 
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                HStack {
                    Button(action: {}) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .font(.title2)
                    }
                    Spacer()
                    Text("For You")
                        .font(.title3)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal)
                
                Divider()
                    .padding(.horizontal)
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                        ForEach(activities, id: \.self) { activity in
                            Button(action: {
                                path.append("ContentView")
                            }) {
                                VStack(spacing: 0) {
                                    Image(activity)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 137)
                                        .clipped()
                                        .cornerRadius(15)
                                    
                                    Text("Activity Name")
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
            .background(Color.offWhite.ignoresSafeArea())
            .navigationDestination(for: String.self) { value in
                if value == "ContentView" {
                    ContentView()
                }
            }
        }
    }
}

struct ForYouPage_Previews: PreviewProvider {
    static var previews: some View {
        ForYou()
    }
}
