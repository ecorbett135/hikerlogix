//
//  HikePlanFormView.swift
//  hikerlogix
//
//  Created by eric corbett on 12/27/23.
//

import SwiftUI

struct HikePlanFormView: View {
    @State private var planTitle: String = ""
    @State private var description: String = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var htmlLink: String = "" // State variable for the HTML link
    @Binding var isPresented: Bool
    
    var onSave: ((HikePlan) -> Void)
    
    var body: some View {
            NavigationView {
                Form {
                    // Add more fields as needed
                    TextField("Title", text: $planTitle)
                    TextField("Description", text: $description)
                    TextField("Track Link", text: $htmlLink) // TextField for the HTML link

                    // Start Date Picker
                    DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                    DatePicker("End Date", selection: $endDate, displayedComponents: .date)
                    
                    // Icon Actions
                    HStack {
                        Spacer()
                        Image(systemName: "gear") // Gear icon
                        Spacer()
                        Image(systemName: "fork.knife") // Food icon
                        Spacer()
                        Image(systemName: "cloud.sun") // Weather icon
                        Spacer()
                    }
                    .padding()
                    
                    // Button Actions
                    HStack {
                        Button("Cancel") {
                            isPresented = false
                        }
                        .foregroundColor(.red)
                        
                        Spacer()
                        
                        Button("Save") {
                            let newPlan = HikePlan(planTitle: planTitle, description: description, startDate: startDate, endDate: endDate, htmllink: htmlLink)
                            onSave(newPlan)
                            isPresented = false
                        }
                    }
                    .navigationBarTitle("New Hike Plan", displayMode: .inline)
                }
            }
        }
    }
