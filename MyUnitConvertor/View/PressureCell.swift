//
//  PressureCell.swift
//  MyUnitConvertor
//
//  Created by Scott Bolin on 2025-01-25.
//

import SwiftUI

struct PressureCell: View {

    var conversion: PressureConversion

    var body: some View {
        let fromPressure = formattedPressureValue(pressure: conversion.startValue, unit: conversion.startPressureUnit)
        let toPressure = formattedPressureValue(pressure: conversion.endValue, unit: conversion.endPressureUnit)
        HStack {
            Text("From: \(fromPressure)")
            Spacer()
            Text("To: \(toPressure)")
        }
        .font(.callout)
        .foregroundColor(.secondary)
        .frame(width: UIScreen.main.bounds.width - 48)
    }

    func formattedPressureValue(pressure: Double, unit: PressureUnit) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 4 // Change this value for accuracy

        var returnString = ""

        let value = NSNumber(value: pressure)
        if let distanceString = formatter.string(from: value) {
            returnString = distanceString + " " + unit.rawValue
        }
        return returnString
    }
}

#Preview {
    PressureCell(conversion: PressureConversion())
}
