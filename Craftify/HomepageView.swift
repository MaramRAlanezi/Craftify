//
//  HomepageView.swift
//  Craftify
//
//  Created by Wejdan Alghamdi on 04/09/1446 AH.
//

import SwiftUI

struct HomepageView: View {
    @State private var selectedTab: String = "Home"
    @State private var path: [String] = []
    var body: some View {
        NavigationStack(path: $path){
            ZStack {
                Color(.background)
                    .ignoresSafeArea()
                
                VStack {
                    ZStack {
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 336, height: 58)
                            .cornerRadius(15)
                        
                        HStack(spacing: 2) {
                            Text("Hello ")
                                .font(.custom("Poppins-Bold", size: 24))
                                //.font(.title)
                                //.fontWeight(.heavy)
                            
                            Image("hi")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 80)
                        }
                        .padding(.trailing, 130)
                    }
                    
                    ZStack {
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 336, height: 128)
                            .cornerRadius(15)
                        
                        VStack(spacing: 30) {
                            Text("Get an Activity based on your supplies ")
                                .font(.custom("Poppins-Regular", size: 16))
//                                .font(.subheadline)
//                                .fontWeight(.bold)
                            
                            Button(action: {
                                path.append("ContentView") // Navigate
                            }) {
                                Text("For You >")
                                    .font(.custom("Poppins-Bold", size: 18))
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 232, height: 40)
                                    .background(Color("pigOrange"))
                                    .cornerRadius(15)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    HStack {
                        Text(" All Activities")
                            .font(.custom("Poppins-Bold", size: 18))
                        
                        Spacer()
                        
                        Button(action: {
                            path.append("ContentView") // Navigate
                        }) {
                            Text("See All >")
                                .font(.custom("Poppins-Regular", size: 16))
                                .font(.body)
                               
                                .foregroundColor(Color("darkOrange"))
                        }
                    }
                    
                    // Move the scrollable rectangles up using padding or offset
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(0..<5) { _ in
                                Button(action: {
                                    path.append("ContentView") // Navigate to ContentView
                                }) {
                                    ZStack {
                                        Rectangle()
                                            .fill(Color.white)
                                            .frame(width: 160, height: 176)
                                            .cornerRadius(15)
                                        
                                        VStack {
                                            Image("activity")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 160, height: 137)
                                                .cornerRadius(15)
                                            
                                            Text("Activity Name")
                                                .font(.custom("Poppins-SemiBold", size: 16))
                                                
                                                .foregroundColor(.black) // Ensures text is visible
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.bottom, 50)
                    
                    Spacer()
                }
                .padding()
                
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            selectedTab = "Supplies"
                            path.append("ContentView") // Navigate
                        }) {
                            VStack {
                                Image(systemName: "paintbrush.fill")
                                    .font(.system(size: 24))
                                    .foregroundColor(selectedTab == "Supplies" ? Color("pigOrange") : Color.gray)
                                Text("Supplies")
                                    .font(.custom("Poppins-Regular", size: 14))
                                    .font(.footnote)
                                    .foregroundColor(selectedTab == "Supplies" ? Color("pigOrange") : Color.gray)
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            selectedTab = "Home"
                        }) {
                            VStack {
                                Image(systemName: "house.fill")
                                    .font(.system(size: 24))
                                    .foregroundColor(selectedTab == "Home" ? Color("pigOrange") : Color.gray)
                                Text("Home")
                                    .font(.custom("Poppins-Regular", size: 14))
                                    .font(.footnote)
                                    .foregroundColor(selectedTab == "Home" ? Color("pigOrange") : Color.gray)
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            selectedTab = "Favorite"
                            path.append("ContentView") // Navigate
                        }) {
                            VStack {
                                Image(systemName: "heart.fill")
                                    .font(.system(size: 24))
                                    .foregroundColor(selectedTab == "Favorite" ? Color("pigOrange") : Color.gray)
                                Text("Favorite")
                                    .font(.custom("Poppins-Regular", size: 14))
                                    .font(.footnote)
                                    .foregroundColor(selectedTab == "Favorite" ? Color("pigOrange") : Color.gray)
                            }
                        }
                        
                        Spacer()
                    }
                    .frame(height: 80)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.top, 50)
                    .ignoresSafeArea(edges: .bottom) // Ensure it ignores the safe area
                }
            }
            .navigationDestination(for: String.self) { value in
                if value == "ContentView" {
                    ContentView()
                }
            }
        }
    }
}

#Preview {
    HomepageView()
}
