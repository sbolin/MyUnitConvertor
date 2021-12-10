//
//  DistanceUnit.swift
//  MyUnitConvertor
//
//  Created by Scott Bolin on 7-Dec-21.
//

import Foundation

enum DistanceUnit: String, CaseIterable {
    case inch = "in"
    case foot = "ft"
    case yard = "yd"
    case mile = "mi"
    case milimeter = "mm"
    case centemeter = "cm"
    case meter = "m"
    case kilometer = "km"
    case nauticMile = "nmi"
}

extension DistanceUnit {
    var conversionFactorToMeter: Double {
        switch self {
        case .inch:
            return 0.0254
        case .foot:
            return 0.3048
        case .yard:
            return 0.9144
        case .milimeter:
            return 0.001
        case .centemeter:
            return 0.01
        case .meter:
            return 1
        case .kilometer:
            return 1000
        case .mile:
            return 1609.344
        case .nauticMile:
            return 1852
        }
    }
}
