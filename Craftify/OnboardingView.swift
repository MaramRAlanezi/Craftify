//
//  OnboardingView.swift
//  Craftify
//
//  Created by Wejdan Alghamdi on 04/09/1446 AH.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    
    let onboardingTitles = ["Create, Craft, and Have Fun!", "How It Works"]
    let onboardingDescriptions = [
        "Unleash your creativity with fun DIY projects and exciting challenges",
        "Pick a project, grab the materials, and follow the easy steps to make something amazing!"
    ]
    
    let onboardingImages = ["ob1", "ob2"]
    @State private var isOnboardingComplete = false
    
    var body: some View {
        NavigationStack{
            VStack {
                
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(currentPage == 0 ? Color("pigOrange") : Color("lightGray"))
                        .frame(width: 170, height: 7)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(currentPage == 1 ? Color("pigOrange") : Color("lightGray"))
                        .frame(width: 170, height: 7)
                }
                .padding(.top, 30)
                
                
                Spacer()
                
                VStack(spacing: 20) {
                    Text(onboardingTitles[currentPage])
                        .font(.custom("Poppins-Bold", size: 24))
                        .font(.title)
                    //.fontWeight(.bold)
                        .foregroundColor(Color("lightGreen")) // lightGreen Color
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.top, 20)
                    
                    Image(onboardingImages[currentPage])
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                        .padding(.top, 30)
                    
                    Text(onboardingDescriptions[currentPage])
                        .font(.custom("Poppins-Regular", size: 18))
                        .font(.body)
                        .foregroundColor(Color("darkGray")) // darkGray Color
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.top, 20)
                }
                
                Spacer()
                
                
                HStack {
                    Spacer()
                    Button(action: {
                        
                        if currentPage < 1 {
                            currentPage += 1
                        } else {
                            isOnboardingComplete = true
                        }
                    }) {
                        Image("BackArrow")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .padding()
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                }
                .padding(.bottom, 40)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .navigationDestination(isPresented: $isOnboardingComplete) {
                ContentView()
            }
            
            
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    OnboardingView()
}
