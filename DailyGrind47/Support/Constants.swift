//
//  Constants.swift
//  DailyGrind47
//
//  Created by Joseph DeWeese on 8/30/24.
//

import SwiftUI

@Observable
class Constants {
    static let shared = Constants()
    
    var appTint: String = UserDefaults.standard.string(forKey: "appTint") ?? "Red"
    
    var tintColor: Color {
        return tints.first { $0.color == appTint }?.value ?? .red
    }
}

