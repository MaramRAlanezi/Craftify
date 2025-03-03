//
//  OnboardingView.swift
//  Craftify
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
    
    var body: some View {
        VStack {
            
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(currentPage == 0 ? Color("Orange1") : Color("LightGrey"))
                    .frame(width: 170, height: 7)
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(currentPage == 1 ? Color("Orange1") : Color("LightGrey"))
                    .frame(width: 170, height: 7)
            }
            .padding(.top, 30)
            
          
            Spacer()
            
            VStack(spacing: 20) {
                Text(onboardingTitles[currentPage])
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Green1")) // Green1 Color
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.top, 20)
                
                Image(onboardingImages[currentPage])
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .padding(.top, 30)
                
                Text(onboardingDescriptions[currentPage])
                    .font(.body)
                    .foregroundColor(Color("Grey1")) // Grey1 Color
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
                        print("Onboarding Complete")
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
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
           // .previewDevice("iPhone 13")
    }
}
