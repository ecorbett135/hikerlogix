//
//  ContentView.swift
//  hikerlogix
//
//  Created by Eric Corbett on 1/2/24.
//

import SwiftUI


struct ContentView: View {
    @State private var showDashboard = false
    
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
