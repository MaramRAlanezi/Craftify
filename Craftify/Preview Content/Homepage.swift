//
//  Homepage.swift
//  Craftify
//
//  Created by Razan on 02/09/1446 AH.
//

import SwiftUI

struct Homepage: View {
    @State private var selectedTab: String = "Home"
    @State private var path: [String] = [] // Stack for navigation

    var body: some View {
        NavigationStack(path: $path) {
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
                                .font(.title)
                                .fontWeight(.heavy)

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
                                .font(.subheadline)
                                .fontWeight(.bold)

                            Button(action: {
                                path.append("ContentView") // Navigate
                            }) {
                                Text("For You >")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 232, height: 40)
                                    .background(Color("orang"))
                                    .cornerRadius(15)
                            }
                        }
                    }

                    Spacer()

                    HStack {
                        Text(" All Activities")
                            .font(.headline)
                            .fontWeight(.heavy)

                        Spacer()

                        Button(action: {
                            path.append("ContentView") // Navigate
                        }) {
                            Text("See All >")
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundColor(Color("lightorang"))
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
                                                .fontWeight(.semibold)
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
                                Image(systemName: "hammer.fill")
                                    .font(.system(size: 24))
                                    .foregroundColor(selectedTab == "Supplies" ? Color("orang") : Color.gray)
                                Text("Supplies")
                                    .font(.footnote)
                                    .foregroundColor(selectedTab == "Supplies" ? Color("orang") : Color.gray)
                            }
                        }

                        Spacer()

                        Button(action: {
                            selectedTab = "Home"
                        }) {
                            VStack {
                                Image(systemName: "house.fill")
                                    .font(.system(size: 24))
                                    .foregroundColor(selectedTab == "Home" ? Color("orang") : Color.gray)
                                Text("Home")
                                    .font(.footnote)
                                    .foregroundColor(selectedTab == "Home" ? Color("orang") : Color.gray)
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
                                    .foregroundColor(selectedTab == "Favorite" ? Color("orang") : Color.gray)
                                Text("Favorite")
                                    .font(.footnote)
                                    .foregroundColor(selectedTab == "Favorite" ? Color("orang") : Color.gray)
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
    Homepage()
}
