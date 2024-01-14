//
//  HikeLogDetailView.swift
//  hikerlogix
//
//  Created by eric corbett on 12/30/23.
//

import SwiftUI

struct LogRecordView: View {
    @Environment(\.managedObjectContext) private var viewContext
    var hikeLog: LogRecords
    
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
                    ForEach(hikeLog.logEntriesArray, id: \.self) {
                        logEntry in Text(logEntry.logEntry ?? "No Entry")
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
                
                Button(action: { showingAddLogEntryForm = true }) {
                    Image(systemName: "plusi.circle")
                        .foregroundColor(.blue)
                        .frame(width: 150, height: 150)
                }
                .sheet(isPresented: $showingAddLogEntryForm) {
                    HikeLogFormView(isPresented: $showingAddLogEntryForm, onSave: { _ in
                        // Handle the updated log as needed
                    }, logRecord: hikeLog)
                }
                .alignmentGuide(.trailing) { d in d[.trailing] }
                .alignmentGuide(.bottom) { d in d[.bottom] }
                
                Spacer()
                
                Button(action: deleteHikeLog) {
                    Image(systemName: "trash.fill")
                        .foregroundColor(.red)
                        .padding()
                        .background(Circle().fill(Color.white))
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

// Short date formatter
private let shortDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM/dd/yyyy"
    return formatter
}()
