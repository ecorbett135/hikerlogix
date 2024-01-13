//
//  SplashView.swift
//  hikelogix
//
//  Created by eric corbett on 12/26/23.
//

import SwiftUI

struct SplashView: View {
    @State private var showSplash = true
    private let splashDisplayDuration = 3.0

    var body: some View {
        ContentView()
            .fullScreenCover(isPresented: $showSplash) {
                splashScreen
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + splashDisplayDuration) {
                            withAnimation(.easeOut) {
                                showSplash = false
                            }
                        }
                    }
            }
    }

    private var splashScreen: some View {
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
            )
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
