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
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \HikeLog.startDate, ascending: false)], animation: .default)
    private var hikeLogs: FetchedResults<HikeLog>
    
    @State private var showHikeLogForm = false
    @State private var showHikePlanForm = false
    @State private var showContentView = false

    var body: some View {
            VStack {
                List {
                    HikeSection(title: "Recent Hikes", hikes: hikeLogs)
                    // Add upcoming hikes section if you have data for it
                }

                MenuButtons
                
                NewHikeButtons

                Spacer()
            }
            .navigationBarTitle("Dashboard", displayMode: .inline)
            .background(BackgroundImage)
            .sheet(isPresented: $showContentView) {
                ContentView()
            }
        }

    private var BackgroundImage: some View {
        Image("mainScreen")
            .resizable()
            .scaledToFill()
            .opacity(0.3)
    }

    private func MenuButton(imageName: String, text: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Image(systemName: imageName)
                    .foregroundColor(.black)
                Text(text)
                    .foregroundColor(.black)
            }
        }
        .padding()
    }

    private var MenuButtons: some View {
        HStack {
            Spacer()
            MenuNavigationLink(imageName: "gear", text: "Gear", destination: GearView())
            
            Spacer()
            MenuNavigationLink(imageName: "fork.knife", text: "Bear Can", destination: GearView())
            
            Spacer()
            // Next Link Here
        }
        .padding()
    }

    private func MenuNavigationLink<Destination: View>(imageName: String, text: String, destination: Destination) -> some View {
        NavigationLink(destination: destination) {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.black)
            Text(text)
                .foregroundColor(.black)
        }
    }

    private var NewHikeButtons: some View {
        HStack {
            NewHikeButton(title: "New Hike Log", showingForm: $showHikeLogForm)
            // Add buttons for future functionality
        }
    }

    private func NewHikeButton(title: String, showingForm: Binding<Bool>) -> some View {
        Button(title) {
            showingForm.wrappedValue = true
        }
        .bold()
        .padding()
        .sheet(isPresented: $showHikeLogForm) {
            HikeLogFormView(isPresented: $showHikeLogForm, onSave: { newLog in
                // Handle the new log as needed
            })
        }
    }
}

// Assuming you have a HikeSection view
struct HikeSection: View {
    let title: String
    let hikes: FetchedResults<HikeLog>

    var body: some View {
        Section(header: Text(title)) {
            ForEach(hikes) { log in
                NavigationLink(destination: LogRecordView(hikeLog: log)) {
                    VStack(alignment: .leading) {
                        Text(log.title ?? "")
                        Text(log.startDate ?? Date(), style: .date)
                    }
                }
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
