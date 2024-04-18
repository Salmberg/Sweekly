//
//  Colors.swift
//  Sweekly
//
//  Created by David Salmberg on 2024-04-16.
//

import SwiftUI

extension Color {
    init(hex: UInt32, opacity: Double = 1.0) {
        let red = Double((hex & 0xFF0000) >> 16) / 255.0
        let green = Double((hex & 0x00FF00) >> 8) / 255.0
        let blue = Double(hex & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, opacity: opacity)
    }
}

let darkGrayColor = Color(hex: 0x333333)
let whiteColor = Color(hex: 0xFFFFFF)
let darkBlueAccentColor = Color(hex: 0x1F497D)
let darkGreenAccentColor = Color(hex: 0x006400)
let lightGrayColor = Color(hex: 0xA4BAB7)
