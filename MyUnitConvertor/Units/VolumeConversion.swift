//
//  VolumeConversion.swift
//  MyUnitConvertor
//
//  Created by Scott Bolin on 16-Dec-21.
//

import Foundation

struct VolumeConversion: Equatable, Hashable, Identifiable {
    var id: UUID = UUID()

    var startValue: Double = 0.0
    var startVolumeUnit: VolumeUnit = .liter
    var endValue: Double = 0.0
    var endVolumeUnit: VolumeUnit = .gallon_US
}
