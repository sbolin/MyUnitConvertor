//
//  PressureConvertorView.swift
//  MyUnitConvertor
//
//  Created by Scott Bolin on 2025-01-25.
//

import SwiftUI

struct PressureConvertorView: View {
    @State var startPressureUnit: PressureUnit = .pa
    @State var endPressureUnit: PressureUnit = .psi
    @ObservedObject var startValue = ValidatedDecimal()

    @State var conversionHistory: [PressureConversion] = []

    var body: some View {
        VStack {
            Text("Pressure Conversion")
                .font(.title3)
                .bold()
                .padding()

            // main conversion view
            HStack {
                Text("Pressure:")
                TextField("e.g. 5\(Locale.current.decimalSeparator!)3", text: $startValue.valueString)
                    .keyboardType(.decimalPad)
                VStack(spacing: 0) {
                    Text("From")
                        .font(.footnote)
                    Picker("\(startPressureUnit.rawValue)", selection: $startPressureUnit) {
                        ForEach(PressureUnit.allCases, id: \.self) { unit in
                            Text(unit.rawValue)
                        }
                    }
                    .pickerStyle(.menu)
                    Rectangle()
                        .frame(width: 50, height: 1)
                        .padding(.bottom, 4)
                    Text("To")
                        .font(.footnote)
                    Picker("\(endPressureUnit.rawValue)", selection: $endPressureUnit) {
                        ForEach(PressureUnit.allCases, id: \.self) { unit in
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
                .tint(.red)
                Spacer()
            } // Button/HStack
            .padding(.bottom)
            if conversionHistory.count != 0 {
                TableHeaderView()
                ForEach(conversionHistory.reversed()) { conversion in
                    VStack(alignment: .leading) {
                        PressureCell(conversion: conversion)
                    }
                }
            } // VStack
        }
    }

    private func convertUnit(valueToConvert: Double, fromUnit: PressureUnit, toUnit: PressureUnit) -> Double {
        return valueToConvert * fromUnit.conversionFactorToPa / toUnit.conversionFactorToPa
    }

    private func saveConversion() {
        var conversion = PressureConversion()

        conversion.id = UUID()
        conversion.startPressureUnit = startPressureUnit
        conversion.endPressureUnit = endPressureUnit
        conversion.startValue = startValue.decimalValue //Double(startValueString) ?? 0.0
        conversion.endValue = convertUnit(valueToConvert: conversion.startValue, fromUnit: startPressureUnit, toUnit: endPressureUnit)
        conversionHistory.append(conversion)
    }

    private func resetInput() {
        startValue.valueString = ""
    }
}

#Preview {
    PressureConvertorView()
}
