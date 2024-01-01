//
//  LogFormView.swift
//  hikerlogix
//
//  Created by eric corbett on 12/27/23.
//

import SwiftUI

struct HikeLogFormView: View {
    @Environment(\.managedObjectContext) private var viewContext
    // Create vars for form inputs
    @State private var title: String = ""
    @State private var logEntry: String = ""
    @State private var startLoc: String = ""
    @State private var endLoc: String = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @Binding var isPresented: Bool
    
    // var for button action
    var onSave: ((HikeLog) -> Void)
    
    init(isPresented: Binding<Bool>, onSave: @escaping (HikeLog) -> Void) {
        _isPresented = isPresented
        self.onSave = onSave
    }
    
    private var currentTimestamp: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy HH:mm:ss"
        return formatter.string(from: Date())
    }
    
    var body: some View {
        NavigationView {
            Form {
                // Add more fields as needed
                TextField("Title", text: $title)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                TextField("Initial Log Entry", text: $logEntry)
                // TextField("Start Location", text: $startLoc)
                // TextField("End Location", text: $endLoc)
                
                // Start Date Picker
                DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                // DatePicker("End Date", selection: $endDate, displayedComponents: .date)
                
                // Icons Actions
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
                        // Create the HikeLog only when Save is pressed
                        let newLog = HikeLog(context: viewContext)
                        newLog.id = UUID()
                        newLog.title = title
                        newLog.logEntry = "\(currentTimestamp): \(logEntry)"
                        newLog.startDate = startDate
                        // Set other properties as needed
                        // ...
                        
                        // Save the context
                        do {
                            try viewContext.save()
                        } catch {
                            print("Error saving context: \(error)")
                        }
                        isPresented = false
                    }
                    .navigationBarTitle("New Hike Log", displayMode: .inline)
                }
            }
        }
    }
}
