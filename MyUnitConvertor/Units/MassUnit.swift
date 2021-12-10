//
//  MassUnit.swift
//  MyUnitConvertor
//
//  Created by Scott Bolin on 11-Dec-21.
//

import Foundation

enum MassUnit: String, CaseIterable {
    case milligram = "mg"
    case gram = "g"
    case kilogram = "kg"
    case ton = "T"
    case ounce = "oz"
    case pound =  "lbs"
    case ton_short = "T-s"
    case ton_long = "T-l"
    case stone_US = "Stone (US)"
    case stone_UK = "Stone (UK)"
    case carat = "ct"
    case kilogram_force = "kg-f"
    case kip = "kip"
    case slug = "slug"
}

extension MassUnit {
    var conversionFactorToKilogram: Double {
        switch self {
        case .milligram:
            return 0.000001
        case .gram:
            return 0.001
        case .kilogram:
            return 1.0
        case .ton:
            return 1000
        case .ounce:
            return 0.0283495231
        case .pound:
            return 0.45359237
        case .ton_short:
            return 907.18474
        case .ton_long:
            return 1016.0469088
        case .stone_US:
            return 5.669904625
        case .stone_UK:
            return 6.35029318
        case .carat:
            return 0.0002
        case .kilogram_force:
            return 9.80665
        case .kip:
            return 453.59237
        case .slug:
            return 14.5939029372
        }
    }
}
