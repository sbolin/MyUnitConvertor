//
//  TemperatureConversion.swift
//  MyUnitConvertor
//
//  Created by Scott Bolin on 8-Dec-21.
//

import Foundation

struct TempConversion: Equatable, Hashable, Identifiable {
    var id: UUID = UUID()

    var startValue: Double = 0.0
    var startTempUnit: TempUnit = .fahrenheit
    var endValue: Double = 0.0
    var endTempUnit: TempUnit = .celcius
}
