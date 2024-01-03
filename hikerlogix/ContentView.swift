//
//  ContentView.swift
//  hikerlogix
//
//  Created by Eric Corbett on 1/2/24.
//

import SwiftUI


struct ContentView: View {
    @State private var showDashboard = false
<<<<<<< HEAD
    
    var body: some View {
        ZStack{
            
            HStack{
                Image(systemName: "gauge.open.with.lines.needle.33percent")
                Button("Dashboard") {
                    showDashboard = true
                }.sheet(isPresented: $showDashboard) {
                    DashboardView()
                }
                
                HStack {
                    Image(systemName: "figure.hiking")
                    Text("Leave No Trace")
                }
            }
        }
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            DashboardView()
        }
    }
=======
    @State private var showContentView = false
    
    var body: some View {
         ZStack{

             // View Background Image
             Image("mainScreen")
                 .resizable()
                 .scaledToFill()
                 .opacity(0.3)
                 .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                 .zIndex(-1)

             // Main Content
             VStack (spacing: 20){
                 // Dashboard Link
                 Button(action: {
                     showDashboard = true
                 }) {
                     VStack {
                         Image(systemName: "gauge.open.with.lines.needle.33percent")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                Text("Dashboard")
                            }
                        }
                        .sheet(isPresented: $showDashboard) {
                            DashboardView()
                        }

                        // Leave no trace link
                        Button(action: {
                            showContentView = true
                        }) {
                            VStack {
                                Image(systemName: "figure.hiking")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                Text("Leave No Trace")
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
>>>>>>> 4aea005 (new views)
