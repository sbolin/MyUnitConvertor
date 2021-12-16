//
//  VolumeConvertorView.swift
//  MyUnitConvertor
//
//  Created by Scott Bolin on 16-Dec-21.
//

import SwiftUI

struct VolumeConvertorView: View {
    @State var startVolumeUnit: VolumeUnit = .gallon_US
    @State var endVolumeUnit: VolumeUnit = .liter
    @ObservedObject var startValue = ValidatedDecimal()

    @State var conversionHistory: [VolumeConversion] = []

    var body: some View {
        VStack {
            Text("Volume Conversion")
                .font(.title3)
                .bold()
                .padding()

            // main conversion view
            HStack {
                Text("Volume:")
                TextField("e.g. 5\(Locale.current.decimalSeparator!)3", text: $startValue.valueString)
                    .keyboardType(.decimalPad)
                VStack(spacing: 0) {
                    Text("From")
                        .font(.footnote)
                    Picker("\(startVolumeUnit.rawValue)", selection: $startVolumeUnit) {
                        ForEach(VolumeUnit.allCases, id: \.self) { unit in
                            Text(unit.rawValue)
                        }
                    }
                    .pickerStyle(.menu)
                    Rectangle()
                        .frame(width: 50, height: 1)
                        .padding(.bottom, 4)
                    Text("To")
                        .font(.footnote)
                    Picker("\(endVolumeUnit.rawValue)", selection: $endVolumeUnit) {
                        ForEach(VolumeUnit.allCases, id: \.self) { unit in
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
                        VolumeCell(conversion: conversion)
                    }
                }
            } // VStack
        }
    }

    private func convertUnit(valueToConvert: Double, fromUnit: VolumeUnit, toUnit: VolumeUnit) -> Double {
        return valueToConvert * fromUnit.conversionFactorToCubicMeter / toUnit.conversionFactorToCubicMeter
    }

    private func saveConversion() {
        var conversion = VolumeConversion()

        conversion.id = UUID()
        conversion.startVolumeUnit = startVolumeUnit
        conversion.endVolumeUnit = endVolumeUnit
        conversion.startValue = startValue.decimalValue //Double(startValueString) ?? 0.0
        conversion.endValue = convertUnit(valueToConvert: conversion.startValue, fromUnit: startVolumeUnit, toUnit: endVolumeUnit)
        conversionHistory.append(conversion)
    }

    private func resetInput() {
        startValue.valueString = ""
    }
}

struct VolumeConvertorView_Previews: PreviewProvider {
    static var previews: some View {
        VolumeConvertorView()
    }
}
