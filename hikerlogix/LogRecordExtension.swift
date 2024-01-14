//
//  LogRecordExtension.swift
//  hikerlogix
//
//  Created by Eric Corbett on 1/13/24.
//

import Foundation
import CoreData

// Make sure to import CoreData if your extension uses Core Data classes

extension LogRecords {
    var logEntriesArray: [LogEntry] {
        let set = logEntries as? Set<LogEntry> ?? []
        return set.sorted(by: { ($0.date ?? Date()) < ($1.date ?? Date()) })
    }
}
