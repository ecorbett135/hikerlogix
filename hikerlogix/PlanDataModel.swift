//
//  LogDataModel.swift
//  hikerlogix
//
//  Created by eric corbett on 12/30/23.
//

import Foundation

struct HikePlan: Identifiable {
    var id = UUID()
    var planTitle: String
    var description: String
    var startDate: Date
    var endDate: Date
    var htmllink : String
}
