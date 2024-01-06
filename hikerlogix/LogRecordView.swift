//
//  HikeLogDetailView.swift
//  hikerlogix
//
//  Created by eric corbett on 12/30/23.
//

import SwiftUI

struct LogRecordView: View {
    @Environment(\.managedObjectContext) private var viewContext
    var hikeLog: HikeLog
    
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
                Text(hikeLog.logEntry ?? "None")
                    .padding()
            }
        }
        .background(
            Image("mainScreen")
                .resizable()
                .scaledToFill()
                .opacity(0.3)
        )
        .navigationBarTitle("Hike Details", displayMode: .inline)
        Button(action: deleteHikeLog) {
            Image(systemName: "trash.fill")
                .foregroundColor(.red)
                .padding()
                .background(Circle().fill(Color.white))
        }
        .padding() // Adjust padding to position the button
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
