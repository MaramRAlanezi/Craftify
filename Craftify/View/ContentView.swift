//
//  ContentView.swift
//  Craftify
//
//  Created by Maram Rabeh  on 28/02/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            
        ScrollView {
               VStack( spacing: 16) {
                   
                   // Header Image
                   Image("1")
                       .resizable()
                       .scaledToFit()
                       .ignoresSafeArea()
                   
                   
                   // Title
                   Text("DIY Cardboard TV Craft")
                       .font(.title)
                       .fontWeight(.semibold)
                       .foregroundColor(Color(hue: 0.0, saturation: 0.0, brightness: 0.001, opacity: 0.66))
                       .padding()
                   
                   // Square Background
                   ZStack {
                       // Background Square
                       RoundedRectangle(cornerRadius: 20)
                           .fill(Color(.LO))
                           .frame(width: 350)
                           .shadow(radius: 0.5)
                       
                       VStack(alignment: .leading, spacing: 16) {
                                                 
                           // Supplies Section
                           VStack(alignment: .leading, spacing: 8) {
                               Text("Supplies")
                                   .font(.title2)
                                   .fontWeight(.semibold)
                                   .foregroundColor(Color(hue: 0.0, saturation: 0.0, brightness: 0.001, opacity: 0.66))
                               
                               VStack(alignment: .leading, spacing: 4) {
                                   Text("• Cardboard")
                                   Text("• Tape")
                                   Text("• Hot glue gun")
                                   Text("• Scissors or box cutter")
                                   Text("• Permanent marker")
                                   Text("• Straight edge")
                               }
                               .foregroundColor(.gray)
                               .padding(.leading)
                               .font(.body)
                           }
                           
                           // Instructions Section
                           VStack(alignment: .leading, spacing: 8) {
                               Text("Instructions")
                                   .font(.title2)
                                   .fontWeight(.semibold)
                                   .foregroundColor(Color(hue: 0.0, saturation: 0.0, brightness: 0.001, opacity: 0.66))
                               
                               VStack(alignment: .leading, spacing: 4) {
                                   Text("1. Step 1: Find a box for your cardboard TV.")
                                   Text("2. Step 2: Cut out your screen opening.")
                                   Text("3. Step 3: Make your television knob.")
                                   Text("4. Step 4: Make your antenna V shape.")
                                   Text("5. Step 5: Make your antenna base.")
                                   Text("6. Step 6: Make a remote.")
                                   Text("7. Step 7: Put it all together, and you have a cardboard TV.")
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
               .navigationBarTitle("", displayMode: .inline) // Empty title
                              .navigationBarItems(
                                  leading: Button(action: {
                                      // Back action (dismiss view)
                                  }) {
                                      Image(systemName: "chevron.left")
                                          .foregroundColor(.black)
                                          .fontWeight(.bold)
                                  }.padding(15),
                                  trailing: Button(action: {
                                      // Heart action (e.g., save to favorites)
                                  }) {
                                      Image(systemName: "heart")
                                          .foregroundColor(.black)
                                          .fontWeight(.bold)
                                  }.padding(15)
                              )
                          }
                      }
                  }
              }


#Preview {
    ContentView()
}
