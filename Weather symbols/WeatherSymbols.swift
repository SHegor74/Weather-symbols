//
//  WeatherSymbols.swift
//  Weather symbols
//
//  Created by Egor Naberezhnov on 22.07.2024.
//

import Foundation

enum WeatherSymbols: String, CaseIterable {
    case clear = "sun.max"
    case rain = "cloud.rain"
    case storm = "cloud.bolt.rain"
    case fog = "cloud.fog"
    case snow = "cloud.snow"
    
    var localizedName: String {
        switch self {
        case .clear:
            return NSLocalizedString("sun.max", comment: "")
        case .rain:
            return NSLocalizedString("cloud.rain", comment: "")
        case .storm:
            return NSLocalizedString("cloud.bolt.rain", comment: "")
        case .fog:
            return NSLocalizedString("cloud.fog", comment: "")
        case .snow:
            return NSLocalizedString("cloud.snow", comment: "")
        }
    }
}
