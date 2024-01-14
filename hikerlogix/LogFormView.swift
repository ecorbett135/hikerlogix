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
    var onSave: ((LogRecords) -> Void)?
    var logRecord: LogRecords?
    
    private var titleBinding: Binding<String> {
        Binding<String>(
            get: { self.title.isEmpty ? self.logRecord?.title ?? "" : self.title },
            set: { self.title = $0 }
        )
    }
    
    private func saveHikeLog() {
        let logRecord = logRecord ?? LogRecords(context: viewContext)
        if logRecord.title == nil {
            // Only set these properties if it's a new record
            logRecord.id = UUID()
            logRecord.title = title
            logRecord.startDate = startDate
            logRecord.endDate = endDate
        }

        let newEntry = LogEntry(context: viewContext)
        newEntry.logEntry = logEntry // Text of the log entry
        newEntry.date = Date() // Date of the log entry
        newEntry.logRecord = logRecord // Associate with LogRecords

        do {
            try viewContext.save()
            onSave?(logRecord)
        } catch {
            // Handle the error
            print("Error saving context: \(error)")
        }
        isPresented = false
    }

    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: titleBinding)
                TextField("New Log Entry", text: $logEntry)
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
            .navigationBarTitle("New Log Entry", displayMode: .inline)
        }
    }
}
 

