//
//  SuppliesView.swift
//  Craftify
//
//  Created by Wejdan Alghamdi on 04/09/1446 AH.
//

import SwiftUI

struct SuppliesView: View {
    let supplies = ["Paper", "Pencil", "Eraser", "Ruler", "Colors", "Scissors", "Soap", "Tape", "Water bottel", "Cards", "Markers", "Ice Cubes", "Stickers", "Glue", "Ribbon", "Binder", "Stapler", "Pencil Case", "Pen Case", "Ruler Case", "Colors Case", "Eraser Case", "Paper Case", "Stickers Case", "Glue Case", "Tape Case", "Water bottel Case", "Cards Case", "Markers Case", "Ice Cubes Case", "Ribbon Case", "Binder Case", "Stapler Case"]
    @State private var selectedSupplies: Set<String> = []
    @State private var selectedSupply: String? = nil
    
    var body: some View {
        
        NavigationView{
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
                
            } .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Pick Your Supplies")
                        .font(.custom("Poppins-Bold", size: 22)) // Custom font and size
                        .foregroundColor(.black) // Optional: Custom color
                }
            }
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(Color.background, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
        }
        
    }
}

#Preview {
    SuppliesView()
}
