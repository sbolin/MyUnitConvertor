//
//  SpeedCell.swift
//  MyUnitConvertor
//
//  Created by Scott Bolin on 10-Dec-21.
//

import SwiftUI

struct SpeedCell: View {

    var conversion: SpeedConversion

    var body: some View {
        let fromDistance = formattedDistanceValue(distance: conversion.startValue, unit: conversion.startSpeedUnit)
        let toDistance = formattedDistanceValue(distance: conversion.endValue, unit: conversion.endSpeedUnit)
        HStack {
            Text("From: \(fromDistance)")
            Spacer()
            Text("To: \(toDistance)")
        }
        .font(.callout)
        .foregroundColor(.secondary)
        .frame(width: UIScreen.main.bounds.width - 48)
    }

    func printConversion(conversion: SpeedConversion) -> String {
        return formattedDistanceValue(distance: conversion.startValue, unit: conversion.startSpeedUnit) + " -> " + formattedDistanceValue(distance: conversion.endValue, unit: conversion.endSpeedUnit)
    }

    func formattedDistanceValue(distance: Double, unit: SpeedUnit) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 4 // Change this value for accuracy

        var returnString = ""

        let value = NSNumber(value: distance)
        if let distanceString = formatter.string(from: value) {
            returnString = distanceString + " " + unit.rawValue
        }
        return returnString
    }
}

struct SpeedCell_Previews: PreviewProvider {
    static var previews: some View {
        SpeedCell(conversion: SpeedConversion(id: UUID(), startValue: 100, startSpeedUnit: .mih, endValue: 160.93, endSpeedUnit: .kmh))
    }
}
