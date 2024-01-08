//
//  ContentView.swift
//  hikerlogix
//
//  Created by Eric Corbett on 1/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showLeaveNoTrace = false

    var body: some View {
        NavigationView {
            ZStack {
                BackgroundImage
                MenuContent
            }
            .navigationBarTitle("Main Menu", displayMode: .inline)
        }
    }

    private var MenuContent: some View {
        VStack(spacing: 20) {
            
            MenuNavigationLink( imageName: "gauge.open.with.lines.needle.33percent", text: "Log Dashbord", destination: DashboardView())
            
            MenuNavigationLink(imageName: "figure.hiking", text: "Leave No Trace", destination: LeaveNoTraceView())

            MenuNavigationLink(imageName: "gear", text: "Gear Locker", destination: ComingSoonView())
            
            MenuNavigationLink(imageName: "fork.knife", text: "Bear Can", destination: ComingSoonView())
            
            MenuNavigationLink(imageName: "cloud.sun", text: "Weather", destination: ComingSoonView())
            
            MenuNavigationLink(imageName: "questionmark.circle", text: "App Info", destination: ComingSoonView())
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

    private func MenuNavigationLink<Destination: View>(imageName: String, text: String, destination: Destination) -> some View {
        NavigationLink(destination: destination) {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.black)
                Text(text)
                    .foregroundColor(.black)
            }
        }
        .padding()
    }
    // Add New Funtions Here
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
