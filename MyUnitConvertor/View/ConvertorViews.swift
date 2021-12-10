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
        ScrollView {
//            LazyVGrid(columns: [grid], spacing: 10) {
            VStack {
                DistanceConvertorView()
                    .background {
                        RoundedRectangle(cornerRadius: 6)
                            .strokeBorder(Color.clear, lineWidth: 0)
                            .background(RoundedRectangle(cornerRadius: 6).fill(Color.blue.opacity(0.1)))
                    }
                    .padding(.horizontal)
                TempConvertorView()
                    .background {
                        RoundedRectangle(cornerRadius: 6)
                            .strokeBorder(Color.clear, lineWidth: 0)
                            .background(RoundedRectangle(cornerRadius: 6).fill(Color.green.opacity(0.1)))
                    }
                    .padding(.horizontal)
                SpeedConvertorView()
                    .background {
                        RoundedRectangle(cornerRadius: 6)
                            .strokeBorder(Color.clear, lineWidth: 0)
                            .background(RoundedRectangle(cornerRadius: 6).fill(Color.pink.opacity(0.1)))
                    }
                    .padding(.horizontal)
            }
        }
    }
}

struct ConvertorViews_Previews: PreviewProvider {
//    static let grid = GridItem()
    static var previews: some View {
        ConvertorViews()
    }
}
