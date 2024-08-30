//
//  Note.swift
//  DailyGrind47
//
//  Created by Joseph DeWeese on 8/30/24.
//
import SwiftUI
import SwiftData


@Model
class Note {
    var creationDate: Date = Date.now
    var text: String
    var page: String?
    
    init(text: String, page: String? = nil) {
        self.text = text
        self.page = page
    }
    
    var objective: Objective?
}

