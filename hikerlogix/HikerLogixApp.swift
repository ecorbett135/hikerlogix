//
//  hikerlogixApp.swift
//  hikerlogix
//
//  Created by eric corbett on 12/27/23.
//

import SwiftUI

@main
struct hikerlogixApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
