//
//  VolumeCell.swift
//  MyUnitConvertor
//
//  Created by Scott Bolin on 16-Dec-21.
//

import SwiftUI

struct VolumeCell: View {

    var conversion: VolumeConversion

    var body: some View {
        let fromVol = formattedVolValue(vol: conversion.startValue, unit: conversion.startVolumeUnit)
        let toVol = formattedVolValue(vol: conversion.endValue, unit: conversion.endVolumeUnit)
        HStack {
            Text("From: \(fromVol)")
            Spacer()
            Text("To: \(toVol)")
        }
        .font(.callout)
        .foregroundColor(.secondary)
        .frame(width: UIScreen.main.bounds.width - 48)
    }

    func formattedVolValue(vol: Double, unit: VolumeUnit) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 4 // Change this value for accuracy

        var returnString = ""

        let value = NSNumber(value: vol)
        if let volumeString = formatter.string(from: value) {
            returnString = volumeString + " " + unit.rawValue
        }
        return returnString
    }
}

struct VolumeCell_Previews: PreviewProvider {
    static var previews: some View {
        VolumeCell(conversion: VolumeConversion(id: UUID(), startValue: 1, startVolumeUnit: .gallon_US, endValue: 3.785411784, endVolumeUnit: .liter))
    }
}
