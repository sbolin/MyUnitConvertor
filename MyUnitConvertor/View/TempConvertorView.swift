//
//  TempConvertorView.swift
//  MyUnitConvertor
//
//  Created by Scott Bolin on 8-Dec-21.
//

import SwiftUI

struct TempConvertorView: View {
    @State var startTempUnit: TempUnit = .fahrenheit
    @State var endTempUnit: TempUnit = .celcius
    @ObservedObject var startValue = ValidatedDecimal()

    @State var conversionHistory: [TempConversion] = []

    var body: some View {
        VStack {
            Text("Temperature Conversion")
                .font(.title3)
                .bold()
                .padding()

            HStack {
                Text("Temperature:")
                TextField("e.g. 5\(Locale.current.decimalSeparator!)3", text: $startValue.valueString)
                    .keyboardType(.decimalPad)
                VStack(spacing: 0) {
                    Text("From")
                        .font(.footnote)
                    Picker("\(startTempUnit.rawValue)", selection: $startTempUnit) {
                        ForEach(TempUnit.allCases, id: \.self) { unit in
                            Text(unit.rawValue)
                        }
                    }
                    .pickerStyle(.menu)
                    Rectangle()
                        .frame(width: 50, height: 1)
                        .padding(.bottom, 4)
                    Text("To")
                        .font(.footnote)
                    Picker("\(endTempUnit.rawValue)", selection: $endTempUnit) {
                        ForEach(TempUnit.allCases, id: \.self) { unit in
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
                .disabled(startValue.valueString == "") // .disabled(startValue == 0.0)
                .buttonStyle(.bordered)
                .tint(.cyan)
                Spacer()
            } // Button/HStack
            .padding(.bottom)
            if conversionHistory.count != 0 {
                TableHeaderView()
                ForEach(conversionHistory.reversed()) { conversion in
                    VStack(alignment: .leading) {
                        TempCell(conversion: conversion)
                    }
                }
            } // VStack
        }
    }

    // 1A
    private func saveConversion() {
        var conversion = TempConversion()

        conversion.id = UUID()
        conversion.startTempUnit = startTempUnit
        conversion.endTempUnit = endTempUnit
        conversion.startValue = startValue.decimalValue // Double(startValueString) ?? 0.0
        conversion.endValue = convertUnit(valueToConvert: conversion.startValue, fromUnit: startTempUnit, toUnit: endTempUnit)
        conversionHistory.append(conversion)
    }

    // 1B
    private func resetInput() {
        startValue.valueString = "" // startValue = 0.0
    }

    // 2
    private func convertUnit(valueToConvert: Double, fromUnit: TempUnit, toUnit: TempUnit) -> Double {
        let toF = conversionToF(value: valueToConvert, unit: fromUnit)
        return conversionFromF(value: toF, unit: toUnit)
    }

    // 3
    private func conversionToF(value: Double, unit: TempUnit) -> Double {
        var factor: Double = 0
        switch unit {
        case .fahrenheit:
            factor = 1.0 * value
        case .celcius:
            factor = 1.8 * value + 32
        case .kelvin:
            factor = 1.8 * value - 241.15
        case .rankin:
            factor = value + 459.67
        }
        return factor
    }
    // 4
    private func conversionFromF(value: Double, unit: TempUnit) -> Double {
        var factor: Double = 0
        switch unit {
        case .fahrenheit:
            factor = value
        case .celcius:
            factor = 5 / 9 * (value - 32)
        case .kelvin:
            factor = 5 / 9 * (value + 241.15)
        case .rankin:
            factor = value - 459.67
        }
        return factor
    }

    // 5
    private func printConversion(conversion: TempConversion) -> String {
        return printTempWithUnit(temperature: conversion.startValue, unit: conversion.startTempUnit) + " -> " + printTempWithUnit(temperature: conversion.endValue, unit: conversion.endTempUnit)
    }

    // 6
    private func printTempWithUnit(temperature: Double, unit: TempUnit) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2 // Change this value for accuracy

        var returnString = ""

        let value = NSNumber(value: temperature)
        if let tempString = formatter.string(from: value) {
            returnString = tempString + " " + unit.rawValue
        }

        return returnString
    }
}

struct TempConvertorView_Previews: PreviewProvider {
    static var previews: some View {
        TempConvertorView()
    }
}
