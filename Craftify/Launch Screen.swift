import SwiftUI

struct LaunchScreen: View {
    @State private var scales: [CGFloat] = Array(repeating: 0.0, count: 8)
    @State private var opacities: [Double] = Array(repeating: 0.0, count: 8)
    @State private var textScale: CGFloat = 0.0
    @State private var textOpacity: Double = 0.0
    @State private var isActive: Bool = false

    var body: some View {
        ZStack {
            Color.offWhite
                .ignoresSafeArea()

            VStack(spacing: 20) {
                if isActive {
                    LaunchScreen()
                } else {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 350)
                        .offset(y: 20)

                    VStack(spacing: 10) {
                        HStack(spacing: 0) {
                            Image("C").resizable().scaledToFit().frame(width: 40, height: 50)
                                .scaleEffect(scales[0]).opacity(opacities[0])

                            Image("r").resizable().scaledToFit().frame(width: 40, height: 50)
                                .scaleEffect(scales[1]).opacity(opacities[1])

                            Image("a").resizable().scaledToFit().frame(width: 40, height: 50)
                                .scaleEffect(scales[2]).opacity(opacities[2])

                            Image("f").resizable().scaledToFit().frame(width: 40, height: 50)
                                .scaleEffect(scales[3]).opacity(opacities[3])

                            Image("t").resizable().scaledToFit().frame(width: 40, height: 50)
                                .scaleEffect(scales[4]).opacity(opacities[4])

                            Image("i").resizable().scaledToFit().frame(width: 24, height: 50) // Narrower "i"
                                .scaleEffect(scales[5]).opacity(opacities[5])

                            Image("ff").resizable().scaledToFit().frame(width: 40, height: 50)
                                .scaleEffect(scales[6]).opacity(opacities[6])

                            Image("y").resizable().scaledToFit().frame(width: 40, height: 50)
                                .scaleEffect(scales[7]).opacity(opacities[7])
                        }




                        // Text BELOW the logo
                        Text("Endless Crafts, Endless Fun!")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .scaleEffect(textScale)
                            .opacity(textOpacity)
                    }

                    .onAppear {
                        for index in 0..<8 {
                            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.2) {
                                withAnimation {
                                    scales[index] = 1.0
                                    opacities[index] = 1.0
                                }
                            }
                        }

                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                            withAnimation {
                                textScale = 1.0
                                textOpacity = 1.0
                            }
                        }

                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                            withAnimation {
                                isActive = true
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}

#Preview {
    LaunchScreen()
}
