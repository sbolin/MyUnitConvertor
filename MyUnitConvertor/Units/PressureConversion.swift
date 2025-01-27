//
//  PressureConversion.swift
//  MyUnitConvertor
//
//  Created by Scott Bolin on 2025-01-25.
//

import Foundation

struct PressureConversion: Equatable, Hashable, Identifiable {
    var id = UUID()

    var startValue: Double = 0.0
    var startPressureUnit: PressureUnit = .pa
    var endValue: Double = 0.0
    var endPressureUnit: PressureUnit = .psi
}
