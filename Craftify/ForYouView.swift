//
//  ForYouView.swift
//  Craftify
//
//  Created by Wejdan Alghamdi on 15/09/1446 AH.
//

import SwiftUI
import CoreML



struct Craft: Identifiable {
    let id = UUID()
    let name: String
    let imageURL: String
    let supplies: String
    let instructions: String
}


struct ForYouView: View {
    
    
    let selectedSupplies: [String]
    @State private var recommendedCrafts: [Craft] = []
    let model = try? Craft_MatchingNew(configuration: MLModelConfiguration())
    let vocabulary: [String: Int]
    
    
    var body: some View {
        
        NavigationView{
            VStack {
   
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                        ForEach(recommendedCrafts) { craft in
                            NavigationLink(destination: ActivityDetailsView(craft: craft)){
                                VStack{
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
            .background(Color.background.ignoresSafeArea())
            .onAppear {
                fetchCrafts()
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("For You")
                        .font(.custom("Poppins-Bold", size: 22)) // Custom font and size
                        .foregroundColor(.black) // Optional: Custom color
                }
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.background, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            
        }.navigationBarBackButtonHidden(true)
        
    }
    
    func vectorizeSupplies(supplies: [String], vocabulary: [String: Int]) -> MLMultiArray? {
        guard let inputArray = try? MLMultiArray(shape: [NSNumber(value: vocabulary.count)], dataType: .double) else {
            return nil
        }
        
        // Initialize array with zeros
        for i in 0..<vocabulary.count {
            inputArray[i] = 0.0
        }
        
        // Set 1.0 for supplies found in the vocabulary
        for supply in supplies {
            if let index = vocabulary[supply] {
                inputArray[index] = 1.0
            }
        }
        
        return inputArray
    }
    
    func loadCraftDetailsMapping() -> [Int: [String: String]]? {
        guard let url = Bundle.main.url(forResource: "craft_details_mapping", withExtension: "json") else {
            print("Error: Craft details file not found")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let mapping = try JSONDecoder().decode([Int: [String: String]].self, from: data)
            return mapping
        } catch {
            print("Error loading craft details: \(error)")
            return nil
        }
    }
    
    func predictCraftDetails(from supplies: [String], vocabulary: [String: Int], threshold: Double = 0.5) -> [[String: String]] {
        guard let model = model else {
            print("Failed to load CoreML model")
            return []
        }
        
        guard let inputVector = vectorizeSupplies(supplies: supplies, vocabulary: vocabulary) else {
            print("Error converting supplies to vector")
            return []
        }
        
        guard let craftDetailsMapping = loadCraftDetailsMapping() else {
            print("Error loading craft details")
            return []
        }
        
        do {
            let prediction = try model.prediction(input: inputVector)
            
            // Convert predictions into craft details
            let classProbabilities = prediction.classProbability
            let matchingCrafts = classProbabilities.filter { $0.value >= threshold }
                .sorted { $0.value > $1.value }
                .compactMap { craftDetailsMapping[Int($0.key)] }  // Fetch full details from mapping
            
            return matchingCrafts
        } catch {
            print("Prediction error: \(error)")
            return []
        }
    }
    // Fetch matching crafts from CoreML
    func fetchCrafts() {
        let crafts = predictCraftDetails(from: selectedSupplies, vocabulary: vocabulary)  // ✅ Calls CoreML model
        
        recommendedCrafts = crafts.map { craftData in
            Craft(
                name: craftData["name"] ?? "Unknown Craft",
                imageURL: craftData["image"] ?? "",
                supplies: craftData["supplies"] ?? "",
                instructions: craftData["instructions"] ?? ""
            )
        }
    }
}





#Preview {
    ForYouView(selectedSupplies: ["Paint", "Scissors"], vocabulary: ["Paint": 1])
}
