//
//  UnitConverter.swift
//  TextFieldCalcs
//
//  Created by Scott Bolin on 28-Nov-21.
//

import SwiftUI

struct DistanceConvertorView: View {
    @State var startDistanceUnit: DistanceUnit = .kilometer
    @State var endDistanceUnit: DistanceUnit = .mile
    //    @State var startValueString = ""
    //    @State var startValue: Double = 0.0
    @ObservedObject var startValue = ValidatedDecimal()

    @State var conversionHistory: [DistanceConversion] = []

    var body: some View {
        VStack {
            Text("Distance Conversion")
                .font(.title3)
                .bold()
                .padding()

            // main conversion view
            HStack {
                Text("Distance:")
                //                TextField("", value: $startValue, format: .number, prompt: Text("Distance to Convert"))
                TextField("e.g. 5\(Locale.current.decimalSeparator!)3", text: $startValue.valueString)
                    .keyboardType(.decimalPad)
                VStack(spacing: 0) {
                    Text("From")
                        .font(.footnote)
                    Picker("\(startDistanceUnit.rawValue)", selection: $startDistanceUnit) {
                        ForEach(DistanceUnit.allCases, id: \.self) { unit in
                            Text(unit.rawValue)
                        }
                    }
                    .pickerStyle(.menu)
                    Rectangle()
                        .frame(width: 50, height: 1)
                        .padding(.bottom, 4)
                    Text("To")
                        .font(.footnote)
                    Picker("\(endDistanceUnit.rawValue)", selection: $endDistanceUnit) {
                        ForEach(DistanceUnit.allCases, id: \.self) { unit in
                            Text(unit.rawValue)
                        }
                    }
                    .pickerStyle(.menu)
                }
            } // Hstack
            .padding(.horizontal, 24)

            // button
            HStack {
                Spacer()
                Button {
                    saveConversion()
                    resetInput()
                } label: {
                    Label("Convert", systemImage: "arrow.triangle.2.circlepath.circle")
                }
                .disabled(startValue.valueString == "")
                .buttonStyle(.bordered)
                .tint(.cyan)
                Spacer()
            } // Button/HStack
            .padding(.bottom)
            if conversionHistory.count != 0 {
                TableHeaderView()
                ForEach(conversionHistory.reversed()) { conversion in
                    VStack(alignment: .leading) {
                        DistanceCell(conversion: conversion)
                    }
                }
            } // VStack
        }
    }

    private func convertUnit(valueToConvert: Double, fromUnit: DistanceUnit, toUnit: DistanceUnit) -> Double {
        return valueToConvert * fromUnit.conversionFactorToMeter / toUnit.conversionFactorToMeter
    }

    private func saveConversion() {
        var conversion = DistanceConversion()

        conversion.id = UUID()
        conversion.startDistanceUnit = startDistanceUnit
        conversion.endDistanceUnit = endDistanceUnit
        conversion.startValue = startValue.decimalValue //Double(startValueString) ?? 0.0
        conversion.endValue = convertUnit(valueToConvert: conversion.startValue, fromUnit: startDistanceUnit, toUnit: endDistanceUnit)
        conversionHistory.append(conversion)
    }

    private func resetInput() {
        startValue.valueString = ""
    }
}

struct UnitConverter_Previews: PreviewProvider {
    static var previews: some View {
        DistanceConvertorView()
    }
}
