//
//  TitleView.swift
//  MyVerse
//
//  Created by Scott Bolin on 29-Oct-21.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        HStack {
            Image(systemName: "arrow.triangle.2.circlepath.circle")
                .font(.system(size: 18, weight: .regular, design: .rounded))
            Text("My Unit Convertor")
                .font(.system(size: 18, weight: .regular, design: .rounded))
        }
        .foregroundColor(.indigo)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
