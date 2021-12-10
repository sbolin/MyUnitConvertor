//
//  MassCell.swift
//  MyUnitConvertor
//
//  Created by Scott Bolin on 11-Dec-21.
//

import SwiftUI

struct MassCell: View {

    var conversion: MassConversion

    var body: some View {
        let fromMass = formattedMassValue(mass: conversion.startValue, unit: conversion.startMassUnit)
        let toMass = formattedMassValue(mass: conversion.endValue, unit: conversion.endMassUnit)
        HStack {
            Text("From: \(fromMass)")
            Spacer()
            Text("To: \(toMass)")
        }
        .font(.callout)
        .foregroundColor(.secondary)
        .frame(width: UIScreen.main.bounds.width - 48)
    }

    func formattedMassValue(mass: Double, unit: MassUnit) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 4 // Change this value for accuracy

        var returnString = ""

        let value = NSNumber(value: mass)
        if let distanceString = formatter.string(from: value) {
            returnString = distanceString + " " + unit.rawValue
        }
        return returnString
    }
}

struct MassCell_Previews: PreviewProvider {
    static var previews: some View {
        MassCell(conversion: MassConversion(id: UUID(), startValue: 1, startMassUnit: .kilogram, endValue: 2.205, endMassUnit: .pound))
    }
}
