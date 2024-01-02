//
//  ContentView.swift
//  hikelogix
//
//  Created by eric corbett on 12/26/23.
//

import SwiftUI

struct SplashView: View {
    @State private var showSplash = true

    var body: some View {
        ZStack {
            if showSplash {
                // Splash Screen Content
                GeometryReader { geometry in
                    VStack {
                        Image("logixLogoNoBorder")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width, height: geometry.size.height / 3, alignment: .top)
                            .clipped()
                        Spacer()
                    }
                    .background(
                        Image("mainScreen")
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                    )
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) { // Adjust time as needed
                        withAnimation {
                            showSplash = false
                        }
                    }
                }
            } else {
                // Dashboard View
                ContentView()
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
