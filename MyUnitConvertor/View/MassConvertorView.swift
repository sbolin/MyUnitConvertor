//
//  MassConvertorView.swift
//  MyUnitConvertor
//
//  Created by Scott Bolin on 11-Dec-21.
//

import SwiftUI

struct MassConvertorView: View {
    @State var startMassUnit: MassUnit = .kilogram
    @State var endMassUnit: MassUnit = .pound
    @ObservedObject var startValue = ValidatedDecimal()

    @State var conversionHistory: [MassConversion] = []

    var body: some View {
        VStack {
            Text("Mass Conversion")
                .font(.title3)
                .bold()
                .padding()

            // main conversion view
            HStack {
                Text("Mass:")
                TextField("e.g. 5\(Locale.current.decimalSeparator!)3", text: $startValue.valueString)
                    .keyboardType(.decimalPad)
                VStack(spacing: 0) {
                    Text("From")
                        .font(.footnote)
                    Picker("\(startMassUnit.rawValue)", selection: $startMassUnit) {
                        ForEach(MassUnit.allCases, id: \.self) { unit in
                            Text(unit.rawValue)
                        }
                    }
                    .pickerStyle(.menu)
                    Rectangle()
                        .frame(width: 50, height: 1)
                        .padding(.bottom, 4)
                    Text("To")
                        .font(.footnote)
                    Picker("\(endMassUnit.rawValue)", selection: $endMassUnit) {
                        ForEach(MassUnit.allCases, id: \.self) { unit in
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
                        MassCell(conversion: conversion)
                    }
                }
            } // VStack
        }
    }

    private func convertUnit(valueToConvert: Double, fromUnit: MassUnit, toUnit: MassUnit) -> Double {
        return valueToConvert * fromUnit.conversionFactorToKilogram / toUnit.conversionFactorToKilogram
    }

    private func saveConversion() {
        var conversion = MassConversion()

        conversion.id = UUID()
        conversion.startMassUnit = startMassUnit
        conversion.endMassUnit = endMassUnit
        conversion.startValue = startValue.decimalValue //Double(startValueString) ?? 0.0
        conversion.endValue = convertUnit(valueToConvert: conversion.startValue, fromUnit: startMassUnit, toUnit: endMassUnit)
        conversionHistory.append(conversion)
    }

    private func resetInput() {
        startValue.valueString = ""
    }
}

struct MassConvertorView_Previews: PreviewProvider {
    static var previews: some View {
        MassConvertorView()
    }
}
