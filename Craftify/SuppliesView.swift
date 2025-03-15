//
//  SuppliesView.swift
//  Craftify
//
//  Created by Wejdan Alghamdi on 04/09/1446 AH.
//

import SwiftUI

struct SuppliesView: View {
    
    let supplies = ["Paper", "Pencil", "Ball", "Beads", "Buttons", "Scissors", "Clothespins", "Coffee Filters", "Craft Sticks", "Cardboard", "Marker", "Egg Carton", "Stickers", "Glue", "Glitter", "Straws", "Stapler", "Pip Cleaners", "Toilet Paper Rolls", "Wiggly Eyes", "Paint Brush", "Yarn", "Popsicle Sticks", "Paper Plate", "Googly Eyes", "Cardstock Paper", "Cotton String", "Paper Cup", "Twine", "Cork Pieces", "Box lid", "Feathers", "Rhinestones"]
    
    let vocabulary = ["Paper":0, "Pencil":1, "Ball":2, "Beads":3, "Buttons":4, "Scissors":5, "Clothespins":6, "Coffee Filters":7, "Craft Sticks":8, "Cardboard":9, "Marker":10, "Egg Carton":11, "Stickers":12, "Glue":13, "Glitter":14, "Straws":15, "Stapler":16, "Pip Cleaners":17, "Toilet Paper Rolls":18, "Wiggly Eyes":19, "Paint Brush":20, "Yarn":21, "Popsicle Sticks":22, "Paper Plate":23, "Googly Eyes":24, "Cardstock Paper":25, "Cotton String":26, "Paper Cup":27, "Twine":28, "Cork Pieces":29, "Box lid":30, "Feathers":31, "Rhinestones":32]
    
    @State private var selectedSupplies: Set<String> = []
    @State private var selectedSupply: String? = nil
    @State private var isNavigating = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                Color.background
                
                
                VStack(spacing: 10){
                    GeometryReader { geometry in
                        let columns = [GridItem(.adaptive(minimum:80), spacing: 10)]
                        
                        ScrollView {
                            LazyVGrid(columns: columns, spacing: 12) {
                                ForEach(supplies, id: \.self) { supply in
                                    Button(action: {
                                        if selectedSupplies.contains(supply) {
                                            selectedSupplies.remove(supply)
                                        } else {
                                            selectedSupplies.insert(supply)
                                        }
                                    }) {
                                        Text(supply)
                                            .font(Font.custom("Poppins-Bold", size: 16))
                                            .frame(maxWidth: .infinity, minHeight: 50)
                                            .background(selectedSupplies.contains(supply) ? Color.pigOrange : Color.lightOrange)
                                            .foregroundColor(selectedSupplies.contains(supply) ? Color.white : Color.black)
                                            .cornerRadius(15)
                                        
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                    
                    Button(action: {
                        
                    }){
                        Text("See Activities")
                            .font(Font.custom("Poppins-Bold", size: 16))
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color.pigOrange)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                }.padding()
                
            }.navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Pick Your Supplies")
                        .font(.custom("Poppins-Bold", size: 22)) // Custom font and size
                        .foregroundColor(.black) // Optional: Custom color
                }
                
            }
            
            .navigationDestination(isPresented: $isNavigating) {
                ForYouView(selectedSupplies: Array(selectedSupplies), vocabulary: vocabulary)}
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.background, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }.accentColor(Color.pigOrange)
        
    }
}

#Preview {
    SuppliesView()
}
