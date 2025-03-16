//
//  HomepageView.swift
//  Craftify
//
//  Created by Wejdan Alghamdi on 04/09/1446 AH.
//

import SwiftUI

struct HomepageView: View {
    @State private var crafts: [Craft] = []
    
    var body: some View {
        NavigationView{
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
                            
                            NavigationLink(destination: SuppliesView()){
                                
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
                        Text("All Activities")
                            .font(.custom("Poppins-Bold", size: 18))
                        
                        Spacer()
                        
                        NavigationLink(destination: AllActivityView()) {
                            Text("See All >")
                                .font(.custom("Poppins-Regular", size: 14))
                                .foregroundColor(Color("darkOrange"))
                        }
                    }
                    
                    // Move the scrollable rectangles up using padding or offset
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            
                            ForEach(crafts.prefix(5)) { craft in  // ✅ Show only 5 crafts
                                NavigationLink(destination: ActivityDetailsView(craft: craft)) {
                                    ZStack {
                                        Rectangle()
                                            .fill(Color.white)
                                            .frame(width: 160, height: 176)
                                            .cornerRadius(15)
                                        
                                        VStack {
                                            AsyncImage(url: URL(string: craft.imageURL)) { image in
                                                image.resizable().scaledToFit().frame(width: 160, height: 137).cornerRadius(15)
                                            } placeholder: {
                                                ProgressView()
                                            }
                                            
                                            Text(craft.name)
                                                .font(.custom("Poppins-SemiBold", size: 16))
                                                .foregroundColor(.black)
                                        }.frame(width: 160, height: 137)
                                    }
                                }
                            }
                            //                            ForEach(0..<5) { _ in
                            //                                Button(action: {
                            //
                            //                                }) {
                            //                                    ZStack {
                            //                                        Rectangle()
                            //                                            .fill(Color.white)
                            //                                            .frame(width: 160, height: 176)
                            //                                            .cornerRadius(15)
                            //
                            //                                        VStack {
                            //                                            Image("activity")
                            //                                                .resizable()
                            //                                                .scaledToFit()
                            //                                                .frame(width: 160, height: 137)
                            //                                                .cornerRadius(15)
                            //
                            //                                            Text("Activity Name")
                            //                                                .font(.custom("Poppins-SemiBold", size: 16))
                            //
                            //                                                .foregroundColor(.black) // Ensures text is visible
                            //                                        }
                            //                                    }
                            //                                }
                            //                            }
                        }
                    }
                    .padding(.bottom, 50)
                    
                    Spacer()
                }
                .padding()
                
                
                //                VStack {
                //                    Spacer()
                //
                //                    HStack {
                //                        Spacer()
                //
                //
                //
                //                        Button(action: {
                //                            selectedTab = "Supplies"
                //                            path.append("ContentView") // Navigate
                //                        }) {
                //                            VStack {
                //                                Image(systemName: "paintbrush.fill")
                //                                    .font(.system(size: 24))
                //                                    .foregroundColor(selectedTab == "Supplies" ? Color("pigOrange") : Color.gray)
                //                                Text("Supplies")
                //                                    .font(.custom("Poppins-Regular", size: 14))
                //                                    .font(.footnote)
                //                                    .foregroundColor(selectedTab == "Supplies" ? Color("pigOrange") : Color.gray)
                //                            }
                //                        }
                //
                //                        Spacer()
                //
                //                        Button(action: {
                //                            selectedTab = "Home"
                //                        }) {
                //                            VStack {
                //                                Image(systemName: "house.fill")
                //                                    .font(.system(size: 24))
                //                                    .foregroundColor(selectedTab == "Home" ? Color("pigOrange") : Color.gray)
                //                                Text("Home")
                //                                    .font(.custom("Poppins-Regular", size: 14))
                //                                    .font(.footnote)
                //                                    .foregroundColor(selectedTab == "Home" ? Color("pigOrange") : Color.gray)
                //                            }
                //                        }
                //
                //                        Spacer()
                //
                //                        Button(action: {
                //                            selectedTab = "Favorite"
                //                            path.append("ContentView") // Navigate
                //                        }) {
                //                            VStack {
                //                                Image(systemName: "heart.fill")
                //                                    .font(.system(size: 24))
                //                                    .foregroundColor(selectedTab == "Favorite" ? Color("pigOrange") : Color.gray)
                //                                Text("Favorite")
                //                                    .font(.custom("Poppins-Regular", size: 14))
                //                                    .font(.footnote)
                //                                    .foregroundColor(selectedTab == "Favorite" ? Color("pigOrange") : Color.gray)
                //                            }
                //                        }
                //
                //                        Spacer()
                //                    }
                //                    .frame(height: 80)
                //                    .background(Color.white)
                //                    .clipShape(RoundedRectangle(cornerRadius: 20))
                //                    .padding(.top, 50)
                //                    .ignoresSafeArea(edges: .bottom) // Ensure it ignores the safe area
                //                }
            }.onAppear {
                loadCrafts()  // ✅ Load crafts on view appear
            }
            //            .navigationDestination(for: String.self) { value in
            //                if value == "ContentView" {
            //                    ContentView()
            //                }
            //            }
        }.accentColor(Color.pigOrange)
    }
    
    // Load Activity from JSON File
    func loadCrafts() {
        if let url = Bundle.main.url(forResource: "craft_details_mapping", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: [String: String]]
                
                crafts = jsonObject?.compactMap { (_, value) in
                    Craft(
                        name: value["name"] ?? "Unknown Craft",
                        imageURL: value["image"] ?? "",
                        supplies: value["supplies"] ?? "",
                        instructions: value["instructions"] ?? ""
                    )
                } ?? []
            } catch {
                print("Error loading crafts: \(error)")
            }
        }
    }
    
    //    func fetchCrafts() {
    //        let exampleCrafts: [Craft] = [
    //            Craft(name: "Paper Plate Bunny", imageURL: "http://drive.google.com/uc?id=1W6hRE7hHR4L2FFuTpnZvdGEl0nJ_3f9h", supplies: "Paper Plate, Paint, Glue", instructions: "Step 1: Cut the plate..."),
    //            Craft(name: "Popsicle Stick House", imageURL: "https://drive.google.com/uc?export=view&id=1kav00rYlcB2coQRRfndspW_AZqvEEczv", supplies: "Popsicle Sticks, Glue", instructions: "Step 1: Arrange the sticks..."),
    //            Craft(name: "Egg Carton Ladybugs", imageURL: "https://drive.google.com/uc?export=view&id=1UQ6gQOZlUFg9kDF8IssfsAMrpLqAR5Va", supplies: "Egg Carton, Paint", instructions: "Step 1: Paint the carton..."),
    //            Craft(name: "Paper Roll Firefly", imageURL: "https://drive.google.com/uc?export=view&id=17bhlhUIYbyiMDwxGNZT-MKC9UDWeEk8S", supplies: "Water Bottle, Cardboard", instructions: "Step 1: Attach the fins..."),
    //            Craft(name: "Colorful Butterflies", imageURL: "http://drive.google.com/uc?id=1RQgJgpHLFMbbo_cn_zqWAHnzqQjlGRId", supplies: "Origami Paper", instructions: "Step 1: Fold the paper...")
    //        ]
    //        crafts = exampleCrafts
    //    }
}

#Preview {
    HomepageView()
}
