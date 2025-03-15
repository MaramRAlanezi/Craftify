//
//  AllActivityView.swift
//  Craftify
//
//  Created by Wejdan Alghamdi on 15/09/1446 AH.
//

import SwiftUI

struct AllActivityView: View {
    
    @State private var allActivities: [Craft] = []
    
    var body: some View {
           NavigationStack {
               ScrollView {
                   LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                       ForEach(allActivities) { craft in
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
               }.background(Color.background)
               .toolbar {
                   ToolbarItem(placement: .principal) {
                       Text("All Activities")
                           .font(.custom("Poppins-Bold", size: 22)) // Custom font and size
                           .foregroundColor(.black) // Optional: Custom color
                   }
                   
               }
               .navigationBarTitleDisplayMode(.inline)
               .toolbarBackground(Color.background, for: .navigationBar)
               .toolbarBackground(.visible, for: .navigationBar)
               .onAppear {
                   loadAllCrafts()
               }
           }
       }

       // ✅ Load all crafts from JSON file
       func loadAllCrafts() {
           if let url = Bundle.main.url(forResource: "craft_details_mapping", withExtension: "json") {
               do {
                   let data = try Data(contentsOf: url)
                   let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: [String: String]]

                   allActivities = jsonObject?.compactMap { (_, value) in
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
}

#Preview {
    AllActivityView()
}
