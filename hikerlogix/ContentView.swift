//
//  ContentView.swift
//  hikerlogix
//
//  Created by Eric Corbett on 1/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showModal: Bool = false
    @State private var selectedView: AnyView?

    var body: some View {
        NavigationView {
            ZStack {
                BackgroundImage
                MenuContent
            }
            .navigationBarTitle("Main Menu", displayMode: .inline)
        }
        .sheet(isPresented: $showModal) {
            selectedView
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            }
        }
    }

    private var MenuContent: some View {
        VStack(spacing: 20) {
            MenuNavigationLink(imageName: "gauge.open.with.lines.needle.33percent", text: "Log Dashboard", destination: DashboardView())
            MenuNavigationLink(imageName: "figure.hiking", text: "Leave No Trace", destination: AnyView(LeaveNoTraceView()))
            MenuNavigationLink(imageName: "gear", text: "Gear Locker", destination: AnyView(ComingSoonView()))
            MenuNavigationLink(imageName: "fork.knife", text: "Bear Can", destination: AnyView(ComingSoonView()))
            MenuNavigationLink(imageName: "cloud.sun", text: "Weather", destination: AnyView(ComingSoonView()))
            MenuNavigationLink(imageName: "questionmark.circle", text: "App Info", destination: AnyView(ComingSoonView()))
            // ADD FUTURE BUTTONS HERE
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }

    private var BackgroundImage: some View {
        Image("mainScreen")
            .resizable()
            .scaledToFill()
            .opacity(0.3)
            .zIndex(-1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
