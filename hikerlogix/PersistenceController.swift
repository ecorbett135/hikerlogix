//
//  PersistenceController.swift
//  hikerlogix
//
//  Created by eric corbett on 12/30/23.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                // Error handling logic
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}
