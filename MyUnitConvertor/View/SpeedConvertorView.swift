//
//  SpeedConvertorView.swift
//  MyUnitConvertor
//
//  Created by Scott Bolin on 8-Dec-21.
//

import SwiftUI

struct SpeedConvertorView: View {
    @State var startSpeedUnit: SpeedUnit = .kmh
    @State var endSpeedUnit: SpeedUnit = .mih
    @ObservedObject var startValue = ValidatedDecimal()

    @State var conversionHistory: [SpeedConversion] = []

    var body: some View {
        VStack {
            Text("Speed Conversion")
                .font(.title3)
                .bold()
                .padding()

            HStack {
                Text("Speed:")
                TextField("e.g. 5\(Locale.current.decimalSeparator!)3", text: $startValue.valueString)
                    .keyboardType(.decimalPad)
                VStack(spacing: 0) {
                    Text("From")
                        .font(.footnote)
                    Picker("\(startSpeedUnit.rawValue)", selection: $startSpeedUnit) {
                        ForEach(SpeedUnit.allCases, id: \.self) { unit in
                            Text(unit.rawValue)
                        }
                    }
                    .pickerStyle(.menu)
                    Rectangle()
                        .frame(width: 50, height: 1)
                        .padding(.bottom, 4)
                    Text("To")
                        .font(.footnote)
                    Picker("\(endSpeedUnit.rawValue)", selection: $endSpeedUnit) {
                        ForEach(SpeedUnit.allCases, id: \.self) { unit in
                            Text(unit.rawValue)
                        }
                    }
                    .pickerStyle(.menu)
                }
            }
            .padding(.horizontal, 24)

            HStack {
                Spacer()
                Button {
                    saveConversion()
                    resetInput()
                } label: {
                    Label("Convert", systemImage: "arrow.triangle.2.circlepath.circle")
                }
                .disabled(startValue.valueString == "")// .disabled(startValue == 0.0)
                .buttonStyle(.bordered)
                .tint(.cyan)
                Spacer()
            }
            .padding(.bottom)
            if conversionHistory.count != 0 {
                TableHeaderView()
                ForEach(conversionHistory.reversed()) { conversion in
                    VStack(alignment: .leading) {
                        SpeedCell(conversion: conversion)
                    }
                }
            }
        }
    }

    private func convertUnit(valueToConvert: Double, fromUnit: SpeedUnit, toUnit: SpeedUnit) -> Double {
        return valueToConvert * fromUnit.conversionFactorToMeter / toUnit.conversionFactorToMeter
    }
    private func saveConversion() {
        var conversion = SpeedConversion()

        conversion.id = UUID()
        conversion.startSpeedUnit = startSpeedUnit
        conversion.endSpeedUnit = endSpeedUnit
        conversion.startValue = startValue.decimalValue // conversion.startValue = Double(startValueString) ?? 0.0
        conversion.endValue = convertUnit(valueToConvert: conversion.startValue, fromUnit: startSpeedUnit, toUnit: endSpeedUnit)
        conversionHistory.append(conversion)
    }

    private func resetInput() {
        startValue.valueString = "" // startValue = 0.0
    }

    private func printConversion(conversion: SpeedConversion) -> String {
        return printSpeedWithUnit(distance: conversion.startValue, unit: conversion.startSpeedUnit) + " -> " + printSpeedWithUnit(distance: conversion.endValue, unit: conversion.endSpeedUnit)
    }

    private func printSpeedWithUnit(distance: Double, unit: SpeedUnit) -> String {
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

struct SpeedConvertorView_Previews: PreviewProvider {
    static var previews: some View {
        SpeedConvertorView()
    }
}
