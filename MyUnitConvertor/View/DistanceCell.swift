//
//  DistanceCell.swift
//  MyUnitConvertor
//
//  Created by Scott Bolin on 10-Dec-21.
//

import SwiftUI

struct DistanceCell: View {

    var conversion: DistanceConversion
    
    var body: some View {
        let fromDistance = formattedDistanceValue(distance: conversion.startValue, unit: conversion.startDistanceUnit)
        let toDistance = formattedDistanceValue(distance: conversion.endValue, unit: conversion.endDistanceUnit)
        HStack {
            Text("From: \(fromDistance)")
            Spacer()
            Text("To: \(toDistance)")
        }
        .font(.callout)
        .frame(width: UIScreen.main.bounds.width - 48)
    }

    func printConversion(conversion: DistanceConversion) -> String {
        return formattedDistanceValue(distance: conversion.startValue, unit: conversion.startDistanceUnit) + " -> " + formattedDistanceValue(distance: conversion.endValue, unit: conversion.endDistanceUnit)
    }

    func formattedDistanceValue(distance: Double, unit: DistanceUnit) -> String {
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

struct DistanceCell_Previews: PreviewProvider {
    static var previews: some View {
        DistanceCell(conversion: .init(id: UUID(), startValue: 100, startDistanceUnit: .mile, endValue: 150, endDistanceUnit: .kilometer))
    }
}
