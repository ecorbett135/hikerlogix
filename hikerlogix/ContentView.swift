//
//  ContentView.swift
//  hikerlogix
//
//  Created by Eric Corbett on 1/2/24.
//

import SwiftUI


struct ContentView: View {
    @State private var showDashboard = false
    @State private var showContentView = false
    
    var body: some View {
         ZStack{

             Image("mainScreen")
                 .resizable()
                 .scaledToFill()
                 .opacity(0.3)
                 .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                 .zIndex(-1)

             // Main Content
             VStack (spacing: 20){
                 
                 Button(action: {
                     showDashboard = true
                 }) {
                     HStack {
                         Image(systemName: "gauge.open.with.lines.needle.33percent")
                             .resizable()
                             .scaledToFit()
                             .frame(width: 50, height: 50)
                             .foregroundColor(.black)
                         Text("Dashboard")
                             .foregroundColor(.black)
                            }
                        }
                        .sheet(isPresented: $showDashboard) {
                            DashboardView()
                        }

                 
                 Button(action: {
                     showContentView = true
                 }) { 
                     HStack {
                                Image(systemName: "figure.hiking")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.black)
                                Text("Leave No Trace")
                                    .foregroundColor(.black)
                            }
                            .sheet(isPresented: $showContentView) {
                                ContentView()
                            }
                        }
                        .padding()
                 
             }
             
         }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
