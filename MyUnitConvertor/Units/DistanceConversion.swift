//
//  DistanceConversion.swift
//  MyUnitConvertor
//
//  Created by Scott Bolin on 8-Dec-21.
//

import Foundation

struct DistanceConversion: Equatable, Hashable, Identifiable {
    var id = UUID()

    var startValue: Double = 0.0
    var startDistanceUnit: DistanceUnit = .kilometer
    var endValue: Double = 0.0
    var endDistanceUnit: DistanceUnit = .mile
}
