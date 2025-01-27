//
//  ConvertorViews.swift
//  MyUnitConvertor
//
//  Created by Scott Bolin on 8-Dec-21.
//

import SwiftUI

struct ConvertorViews: View {
//    let grid: GridItem
    var body: some View {
        VStack {
            TitleView()
            ScrollView {
    //            LazyVGrid(columns: [grid], spacing: 10) {
                VStack {
                    PressureConvertorView()
                        .background {
                            RoundedRectangle(cornerRadius: 6)
                                .strokeBorder(Color.clear, lineWidth: 0)
                                .background(RoundedRectangle(cornerRadius: 6).fill(Color.red.opacity(0.2)))
                        }
                        .padding(.horizontal)
                    MassConvertorView()
                        .background {
                            RoundedRectangle(cornerRadius: 6)
                                .strokeBorder(Color.clear, lineWidth: 0)
                                .background(RoundedRectangle(cornerRadius: 6).fill(Color.yellow.opacity(0.2)))
                        }
                        .padding(.horizontal)

                    TempConvertorView()
                        .background {
                            RoundedRectangle(cornerRadius: 6)
                                .strokeBorder(Color.clear, lineWidth: 0)
                                .background(RoundedRectangle(cornerRadius: 6).fill(Color.green.opacity(0.2)))
                        }
                        .padding(.horizontal)

                    DistanceConvertorView()
                        .background {
                            RoundedRectangle(cornerRadius: 6)
                                .strokeBorder(Color.clear, lineWidth: 0)
                                .background(RoundedRectangle(cornerRadius: 6).fill(Color.blue.opacity(0.2)))
                        }
                        .padding(.horizontal)

                    VolumeConvertorView()
                        .background {
                            RoundedRectangle(cornerRadius: 6)
                                .strokeBorder(Color.clear, lineWidth: 0)
                                .background(RoundedRectangle(cornerRadius: 6).fill(Color.indigo.opacity(0.2)))
                        }
                        .padding(.horizontal)

                    SpeedConvertorView()
                        .background {
                            RoundedRectangle(cornerRadius: 6)
                                .strokeBorder(Color.clear, lineWidth: 0)
                                .background(RoundedRectangle(cornerRadius: 6).fill(Color.purple.opacity(0.2)))
                        }
                        .padding(.horizontal)
                } // VStack
            }
        } // ScrollView
    } // View
}

struct ConvertorViews_Previews: PreviewProvider {
//    static let grid = GridItem()
    static var previews: some View {
        ConvertorViews()
    }
}
