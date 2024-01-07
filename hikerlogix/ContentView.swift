//
//  ContentView.swift
//  hikerlogix
//
//  Created by Eric Corbett on 1/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showDashboard = false
    @State private var showLeaveNoTrace = false

    var body: some View {
        ZStack {
            BackgroundImage
            MenuContent
        }
    }

    private var MenuContent: some View {
        VStack(spacing: 20) {
            // Menu Description
            Text("Main Menu")
                .font(.largeTitle)
                .bold()
                .padding() // Add padding around the text

            MenuButton(imageName: "gauge.open.with.lines.needle.33percent", text: "Dashboard") {
                showDashboard = true
            }
            .sheet(isPresented: $showDashboard) {
                DashboardView()
            }

            MenuButton(imageName: "figure.hiking", text: "Leave No Trace") {
                showLeaveNoTrace = true
            }
            .sheet(isPresented: $showLeaveNoTrace) {
                LeaveNoTraceView()
            }

            MenuButton(imageName: "gear", text: "Gear Locker") {
                showLeaveNoTrace = true
            }
            .sheet(isPresented: $showLeaveNoTrace) {
                LeaveNoTraceView()
            }
            
            MenuButton(imageName: "fork.knife", text: "Bear Can") {
                showLeaveNoTrace = true
            }
            .sheet(isPresented: $showLeaveNoTrace) {
                LeaveNoTraceView()
            }
            
            MenuButton(imageName: "cloud.sun", text: "Weather") {
                showLeaveNoTrace = true
            }
            .sheet(isPresented: $showLeaveNoTrace) {
                LeaveNoTraceView()
            }
            
            MenuButton(imageName: "questionmark.circle", text: "App Info") {
                showLeaveNoTrace = true
            }
            .sheet(isPresented: $showLeaveNoTrace) {
                LeaveNoTraceView()
            }
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

    private func MenuButton(imageName: String, text: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.black)
                Text(text)
                    .foregroundColor(.black)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
