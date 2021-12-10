//
//  SpeedConversion.swift
//  MyUnitConvertor
//
//  Created by Scott Bolin on 9-Dec-21.
//

import Foundation

struct SpeedConversion: Identifiable {
    var id: UUID = UUID()

    var startValue: Double = 0.0
    var startSpeedUnit: SpeedUnit = .kmh
    var endValue: Double = 0.0
    var endSpeedUnit: SpeedUnit = .mih
}
