//
//  DashboardView.swift
//  hikelogix
//
//  Created by eric corbett on 12/27/23.
//

import SwiftUI
import CoreData

struct DashboardView: View {
    @Environment(\.managedObjectContext) private var viewContext

        // FetchRequest for HikeLogs
        @FetchRequest(
            sortDescriptors: [NSSortDescriptor(keyPath: \HikeLog.startDate, ascending: true)],
            animation: .default)
        private var hikeLogs: FetchedResults<HikeLog>
    
    @State private var hikePlans: [HikePlan] = []
    @State private var showingHikeLogForm = false
    @State private var showingHikePlanForm = false
    
    var body: some View {
        NavigationView {
            VStack {
                Section(header: Text("Recent Hikes")) {
                    List {
                        ForEach(hikeLogs) { log in
                            NavigationLink(destination: HikeLogDetailView(hikeLog: log)) {
                                VStack(alignment: .leading) {
                                    Text(log.title ?? "")
                                    Text(log.startDate ?? Date(), style: .date)
                                }
                            }
                        }
                    }
                }
                
                // Upcoming Goals Section
                Section(header: Text("Upcoming Hikes")) {
                    List(hikePlans) { plan in
                        VStack(alignment: .leading) {
                            Text(plan.planTitle)
                            Text(plan.startDate, style: .date)
                        }
                    }
                }

                // Placeholder icons
                HStack {
                    Spacer()
                    Image(systemName: "gear") // Gear icon
                    Text("Gear Locker")
                    Spacer()
                    Image(systemName: "fork.knife") // Food icon
                    Text("Bear Can")
                    Spacer()
                }
                .padding()

                // Start New Hike Log Button
                Button("Start New Hike Log") {
                    showingHikeLogForm = true
                }
                .sheet(isPresented: $showingHikeLogForm) {
                    HikeLogFormView(isPresented: $showingHikeLogForm, onSave: { newLog in
                        newLog.title = newLog.title
                        newLog.logEntry = newLog.logEntry
                        newLog.startDate = newLog.startDate
                        newLog.endDate = newLog.endDate

                        do {
                            try viewContext.save()
                        } catch {
                            // Handle the error appropriately
                            print("Error saving context: \(error)")
                        }
                    })
                }


                // Start New Hike Plan Button
                Button("Start New Hike Plan") {
                    showingHikePlanForm = true
                }
                .padding()

                Spacer()
            }
            .navigationBarTitle("Dashboard", displayMode: .inline)
            .background(
                Image("mainScreen")
                .resizable()
                .scaledToFill()
                .opacity(0.3) // Adjust the opacity as needed
                .edgesIgnoringSafeArea(.all)
            )
        }
    }
}
                

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

