//
//  Objective.swift
//  DailyGrind47
//
//  Created by Joseph DeWeese on 8/30/24.
//

import SwiftUI
import SwiftData

@Model
class Objective {
    /// Properties
    var title: String
    var remarks: String
    var dateAdded: Date
    var targetDate: Date
    var dateCompleted: Date
    var status: Status.RawValue
    var assignedTo: String = ""
    var tintColor: String
    var enableRemainder: Bool = false
    var remainderID: String = ""
    @Relationship(deleteRule: .cascade)
    var notes: [Note]?
    
    init(
        title: String,
        remarks: String,
        dateAdded: Date = Date.now,
        targetDate: Date = Date.distantFuture,
        dateCompleted: Date = Date.distantPast,
        status: Status = .active,
        assignedTo: String,
        tintColor: String,
        enableRemainder: Bool,
        remainderID: String
    ) {
        self.title = title
        self.remarks = remarks
        self.dateAdded = dateAdded
        self.targetDate = targetDate
        self.dateCompleted = dateCompleted
        self.status = status.rawValue
        self.assignedTo = assignedTo
        self.tintColor = tintColor
        self.enableRemainder = enableRemainder
        self.remainderID = remainderID
    }
    /// Conforming Codable Protocol
    enum CodingKeys: CodingKey {
        case title
        case remarks
        case dateAdded
        case category
        case tintColor
    }
    
   
    /// Extracting Color Value from tintColor String
    @Transient
    var color: Color {
        return tints.first(where: { $0.color == tintColor })?.value ?? Constants.shared.tintColor
    }
    
    @Transient
    var tint: TintColor? {
        return tints.first(where: { $0.color == tintColor })
    }
    
}
///TODO:  create custom icons for icon
enum Status: Int, Codable, Identifiable, CaseIterable {
    case planning,active, completed, hold
    var id: Self {
        self
    }
    var descr: String {
        switch self {
        case .planning:
            "Planning"
        case .active:
            "Active"
        case .completed:
            "Completed"
        case .hold:
            "Hold"
        }
    }
}

