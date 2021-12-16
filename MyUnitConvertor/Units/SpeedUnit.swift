//
//  SpeedUnit.swift
//  MyUnitConvertor
//
//  Created by Scott Bolin on 9-Dec-21.
//

import Foundation

enum SpeedUnit: String, CaseIterable {
    case mms = "mm/sec"
    case mmm = "mm/min"
    case mmh = "mm/hr"
    case cms = "cm/sec"
    case cmm = "cm/min"
    case cmh = "cm/hr"
    case ms = "m/sec"
    case mm = "m/min"
    case mh = "m/hr"
    case kms = "km/sec"
    case kmm = "km/min"
    case kmh = "km/hr"
    case fts = "ft/sec"
    case ftm = "ft/min"
    case fth = "ft/hr"
    case ys = "yd/sec"
    case ym = "yd/min"
    case yh = "yd/hr"
    case mis = "mi/sec"
    case mim = "mi/min"
    case mih = "mi/hr"
    case knot = "kt/kn"
    case knotUK = "kt-UK"
    case mach = "mach"
    case machSI = "mach-SI"
    case c = "c"

}

extension SpeedUnit {
    var conversionFactorToMeter: Double {
        switch self {
        case .mms: return 0.001
        case .mmm: return 0.0000166667
        case .mmh: return 0.00000027777777777778
        case .cms: return 0.01
        case .cmm: return 0.0001666667
        case .cmh: return 0.0000027777777777778
        case .ms: return 1
        case .mm: return 0.0166666667
        case .mh: return 0.0002777778
        case .kms: return 1000.0
        case .kmm: return 16.6666666667
        case .kmh: return 0.2777777778
        case .fts: return 0.3048
        case .ftm: return 0.00508
        case .fth: return 0.0000846667
        case .ys: return 0.9144
        case .ym: return 0.01524
        case .yh: return 0.000254
        case .mis: return 1609.344
        case .mim: return 26.8224
        case .mih: return 0.44704
        case .knot: return 0.5144444444
        case .knotUK: return 0.5147733333
        case .mach: return 343.6
        case .machSI: return 295.0464000003
        case .c: return 299792458.0
        }
    }
}
