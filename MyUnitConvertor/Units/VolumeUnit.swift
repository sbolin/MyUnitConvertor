//
//  VolumeUnit.swift
//  MyUnitConvertor
//
//  Created by Scott Bolin on 16-Dec-21.
//

import Foundation

enum VolumeUnit: String, CaseIterable {
    case exaliter = "Exaliter"
    case petaliter = "Petaliter"
    case teraliter = "Teraliter"
    case cubic_kilometer = "km^3"
    case gigaliter = "Gigaliter"
    case megaliter = "Megaliter"
    case kiloliter = "Kiloliter"
    case liter = "Liter"
    case milliliter = "mL"
    case cubic_meter = "m^3"
    case cubic_decimeter = "dm^3"
    case cubic_centimeter = "cm^3"
    case cubic_millimeter = "mm^3"
    case hectoliter = "Hectoliter"
    case dekaliter = "Dekaliter"
    case deciliter = "Deciliter"
    case centiliter = "Centiliter"
    case cc = "cc"
    case microliter = "Microliter"
    case nanoliter = "NanoliterL"
    case picoliter = "Picoliter"
    case femtoliter = "Femtoliter"
    case attoliter = "Attoliter"
    case dekastere = "Dekastere"
    case stere = "Stere"
    case decistere = "Decistere"
    case drop = "Drop"
    case gallon_US = "Gallon"
    case quart_US = "Quart"
    case pint_US = "Pint"
    case cup_US = "Cup"
    case tablespoon_US = "Tablespoon"
    case teaspoon_US = "Teaspoon"
    case dessertspoon_US = "Dessertspoon"
    case ounce_US = "Ounce"
    case barrel_US = "Barrel"
    case cubic_mile = "mi^3"
    case cubic_yard = "yd^3"
    case cubic_foot = "ft^3"
    case cubic_inch = "in^3"
    case gill_US = "Gill"
    case minim_US = "Minim"
    case barrel_oil = "Barrel (oil)"
    case barrel_UK = "Barrel (UK)"
    case gallon_UK = "Gallon (UK)"
    case quart_UK = "Quart (UK)"
    case pint_UK = "Pint (UK)"
    case cup_UK = "Cup (UK)"
    case ounce_UK = "Ounce (UK)"
    case tablespoon_UK = "Tablespoon (UK)"
    case teaspoon_UK = "Teaspoon (UK)"
    case dessertspoon_UK = "Dessertspoon (UK)"
    case gill_UK = "Gill (UK)"
    case minim_UK = "Minim (UK)"
    case cup_metric = "Cup (M)"
    case tablespoon_metric = "Tablespoon (M)"
    case teaspoon_metric = "Teaspoon (M)"
    case ton_register = "Ton reg"
    case ccf = "ccf"
    case hundred_cubic_foot = "hcf"
    case acre_foot = "ac*ft"
    case acre_foot_US = "ac*ft (US Survey)"
    case acre_inch = "ac*in"
    case cord = "cd"
    case tun = "tun"
    case hogshead = "hog"
    case board_foot = "bf"
    case dram = "dr"
    case cor_Biblical = "cor"
    case homer_Biblical = "homer"
    case bath_Biblical = "bath"
    case hin_Biblical = "hin"
    case cab_Biblical = "cab"
    case log_Biblical = "log"
    case Taza_Spanish = "taza"
    case Earth_volume = "Earth"
}

extension VolumeUnit {
    var conversionFactorToCubicMeter: Double {
        switch self {

        case .exaliter: return 1000000000000000
        case .petaliter: return 1000000000000
        case .teraliter: return 1000000000
        case .cubic_kilometer: return 1000000000
        case .gigaliter: return 1000000
        case .megaliter: return 1000
        case .kiloliter: return 1
        case .liter: return 0.001
        case .milliliter: return 0.000001
        case .cubic_meter: return 1.0
        case .cubic_decimeter: return 0.001
        case .cubic_centimeter: return 0.000001
        case .cubic_millimeter: return 0.000000001
        case .hectoliter: return 0.1
        case .dekaliter: return 0.01
        case .deciliter: return 0.0001
        case .centiliter: return 0.00001
        case .cc: return 0.000001
        case .microliter: return 0.000000001
        case .nanoliter: return 0.000000000001
        case .picoliter: return 0.000000000000001
        case .femtoliter: return 0.000000000000000001
        case .attoliter: return 0.000000000000000000001
        case .dekastere: return 10
        case .stere: return 1
        case .decistere: return 0.1
        case .drop: return 0.00000005
        case .gallon_US: return 0.0037854118
        case .quart_US: return 0.0009463529
        case .pint_US: return 0.0004731765
        case .cup_US: return 0.0002365882
        case .tablespoon_US: return 0.0000147868
        case .teaspoon_US: return 0.00000492892159375
        case .dessertspoon_US: return 0.0000098578431875
        case .ounce_US: return 0.0000295735
        case .barrel_US: return 0.1192404712
        case .cubic_mile: return 4168181825.4406
        case .cubic_yard: return 0.764554858
        case .cubic_foot: return 0.0283168466
        case .cubic_inch: return 0.0000163871
        case .gill_US: return 0.0001182941
        case .minim_US: return 0.000000061611519921875
        case .barrel_oil: return 0.1589872949
        case .barrel_UK: return 0.16365924
        case .gallon_UK: return 0.00454609
        case .quart_UK: return 0.0011365225
        case .pint_UK: return 0.0005682613
        case .cup_UK: return 0.0002841306
        case .ounce_UK: return 0.0000284131
        case .tablespoon_UK: return 0.0000177582
        case .teaspoon_UK: return 0.0000059193880208333
        case .dessertspoon_UK: return 0.0000118388
        case .gill_UK: return 0.0001420653
        case .minim_UK: return 0.000000059193880208333
        case .cup_metric: return 0.00025
        case .tablespoon_metric: return 0.000015
        case .teaspoon_metric: return 0.000005
        case .ton_register: return 2.8316846592
        case .ccf: return 2.8316846592
        case .hundred_cubic_foot: return 2.8316846592
        case .acre_foot: return 1233.4818375475
        case .acre_foot_US: return 1233.4892384682
        case .acre_inch: return 102.790153129
        case .cord: return 3.6245563638
        case .tun: return 0.9539237696
        case .hogshead: return 0.2384809424
        case .board_foot: return 0.0023597372
        case .dram: return 0.0000036966911953125
        case .cor_Biblical: return 0.22
        case .homer_Biblical: return 0.22
        case .bath_Biblical: return 0.022
        case .hin_Biblical: return 0.0036666667
        case .cab_Biblical: return 0.0012222222
        case .log_Biblical: return 0.0003055556
        case .Taza_Spanish: return 0.0002365882
        case .Earth_volume: return 1083000000000000000000
        }
    }
}
