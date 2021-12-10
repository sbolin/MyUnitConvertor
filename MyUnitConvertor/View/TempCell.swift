//
//  TempCell.swift
//  MyUnitConvertor
//
//  Created by Scott Bolin on 10-Dec-21.
//

import SwiftUI

struct TempCell: View {

    var conversion: TempConversion

    var body: some View {
        let fromTemp = formattedDistanceValue(distance: conversion.startValue, unit: conversion.startTempUnit)
        let toTemp = formattedDistanceValue(distance: conversion.endValue, unit: conversion.endTempUnit)
        HStack {
            Text("From: \(fromTemp)")
            Spacer()
            Text("To: \(toTemp)")
        }
        .font(.callout)
        .foregroundColor(.secondary)
        .frame(width: UIScreen.main.bounds.width - 48)
    }

    func formattedDistanceValue(distance: Double, unit: TempUnit) -> String {
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

struct TempCell_Previews: PreviewProvider {
    static var previews: some View {
        TempCell(conversion: TempConversion(id: UUID(), startValue: 72, startTempUnit: .fahrenheit, endValue: 22.22, endTempUnit: .celcius))
    }
}
