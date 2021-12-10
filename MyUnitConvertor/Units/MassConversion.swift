//
//  MassConversion.swift
//  MyUnitConvertor
//
//  Created by Scott Bolin on 11-Dec-21.
//

import Foundation

struct MassConversion: Equatable, Hashable, Identifiable {
    var id = UUID()

    var startValue: Double = 0.0
    var startMassUnit: MassUnit = .kilogram
    var endValue: Double = 0.0
    var endMassUnit: MassUnit = .pound
}
