//
//  LogFormView.swift
//  hikerlogix
//
//  Created by eric corbett on 12/27/23.
//

import SwiftUI

struct HikeLogFormView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var isPresented: Bool
    
    // Form inputs
    @State private var title: String = ""
    @State private var logEntry: String = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    
    // onSave action
    var onSave: ((HikeLog) -> Void)?
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Initial Log Entry", text: $logEntry)
                DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                DatePicker("End Date", selection: $endDate, displayedComponents: .date)
                
                HStack {
                    // Icons (if these should be functional, add actions)
                    Spacer()
                    Image(systemName: "gear")
                    Spacer()
                    Image(systemName: "fork.knife")
                    Spacer()
                    Image(systemName: "cloud.sun")
                    Spacer()
                }
                .padding()
                
                HStack {
                    Button("Cancel") {
                        isPresented = false
                    }
                    .foregroundColor(.red)
                    
                    Spacer()
                    
                    Button("Save") {
                        saveHikeLog()
                    }
                }
            }
            .navigationBarTitle("New Hike Log", displayMode: .inline)
        }
    }

    private func saveHikeLog() {
        if !title.isEmpty || !logEntry.isEmpty {
            let newLog = HikeLog(context: viewContext)
            newLog.id = UUID()
            newLog.title = title
            newLog.logEntry = "\(DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .short)): \(logEntry)"
            newLog.startDate = startDate
            // Set other properties as needed

            do {
                try viewContext.save()
                onSave?(newLog)
            } catch {
                // Provide user feedback for the error
                print("Error saving context: \(error)")
            }
        } else {
            // Provide user feedback for validation failure
        }
        isPresented = false
    }
}
