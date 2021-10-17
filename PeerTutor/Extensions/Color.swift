//
//  Color.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/17/21.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
    
    static let aboutTheme = AboutTheme()
    static let infoTheme = InfoTheme()
    static let learningRequestTheme = LearningRequestTheme()
    static let learningSessionTheme = LearningSessionTheme()
    static let teachingRequestTheme = TeachingRequestTheme()
    static let teachingSessionTheme = TeachingSessionTheme()
}

struct ColorTheme {
    let background = Color("BackgroundColor")
    let secondaryBackground = Color("SecondaryBackgroundColor")

    let blue = Color("BlueColor")
    let green = Color("GreenColor")
    let orange = Color("OrangeColor")
    let purple = Color("PurpleColor")
    let red = Color("RedColor")
    let yellow = Color("YellowColor")
    
    let text = Color("TextColor")
    let secondaryText = Color("SecondaryTextColor")
}

struct AboutTheme {
    let background = Color("AboutBackground")
    let foreground = Color("AboutForeground")
}

struct InfoTheme {
    let background = Color("InformationBackground")
    let foreground = Color("InformationForeground")
}

struct LearningRequestTheme {
    let background = Color("LearningRequestBackground")
    let foreground = Color("LearningRequestForeground")
}

struct LearningSessionTheme {
    let background = Color("LearningSessionBackground")
    let foreground = Color("LearningSessionForeground")
}

struct TeachingRequestTheme {
    let background = Color("TeachingRequestBackground")
    let foreground = Color("TeachingRequestForeground")
}

struct TeachingSessionTheme {
    let background = Color("TeachingSessionBackground")
    let foreground = Color("TeachingSessionForeground")
}
