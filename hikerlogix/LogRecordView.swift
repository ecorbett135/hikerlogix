//
//  HikeLogDetailView.swift
//  hikerlogix
//
//  Created by eric corbett on 12/30/23.
//

import SwiftUI

struct LogRecordView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var hikeLog: LogRecords // Make this an ObservedObject
    
    // var hikeLog: LogRecords
    
    @State private var showingAddLogEntryForm = false

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
            ScrollView {
                VStack(alignment: .leading) {
                    // Title
                    Text(hikeLog.title ?? "")
                        .font(.largeTitle)
                        .padding()
                    // Dates with Labels
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Start Date")
                            Text(hikeLog.startDate ?? Date(), formatter: shortDateFormatter)
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("End")
                            Text(hikeLog.endDate ?? Date(), formatter: shortDateFormatter)
                        }
                    }.padding()
                    // Log Entry Label and Text
                    Text("Log Entries")
                        .font(.headline)
                    Spacer()
                    ForEach(hikeLog.logEntriesArray, id: \.self) { logEntry in
                        VStack(alignment: .leading) {
                            if let entryDate = logEntry.date {
                                Text("\(entryDate, formatter: dateTimeFormatter)")
                                    .bold()
                            }
                            Text(logEntry.logEntry ?? "No Entry")
                                .padding(.horizontal)
                            Spacer()
                        }
                    }
                }
            }
            .background(
                Image("mainScreen")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.3)
            )
            .navigationBarTitle("Hike Details", displayMode: .inline)
            
            HStack{
                
                Button(action: deleteHikeLog) {
                    Image(systemName: "trash.fill")
                        .imageScale(.large)
                        .font(.system(size: 22))
                        .foregroundColor(.red)
                        .padding()
                }
                Spacer()
                Button(action: { showingAddLogEntryForm = true }) {
                    Image(systemName: "plus.circle")
                        .imageScale(.large)
                        .font(.system(size: 30))
                        .foregroundColor(.blue)
                        .padding()
                }
                .sheet(isPresented: $showingAddLogEntryForm) {
                    HikeLogFormView(isPresented: $showingAddLogEntryForm, onSave: { _ in
                        // Handle the updated log as needed
                    }, logRecord: hikeLog)
                }
                .padding([.leading, .bottom, .trailing]) // Add padding to position the HStack
            }
        }
    }

    private func deleteHikeLog() {
        viewContext.delete(hikeLog)

        do {
            try viewContext.save()
        } catch {
            print("Error saving context after deletion: \(error)")
        }
    }
}

private let shortDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM/dd/yyyy"
    return formatter
}()

private let dateTimeFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()
