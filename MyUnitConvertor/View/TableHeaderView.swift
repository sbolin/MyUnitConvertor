//
//  TableHeaderView.swift
//  MyUnitConvertor
//
//  Created by Scott Bolin on 10-Dec-21.
//

import SwiftUI

struct TableHeaderView: View {
    var body: some View {
        VStack {
            HStack {
                Text("From:")
                Spacer()
                Image(systemName: "arrow.right")
                    .foregroundColor(.green)
                Spacer()
                Text("To:")
            }
            .font(.callout)
            .foregroundColor(.secondary)
            Divider()
        }
        .frame(width: UIScreen.main.bounds.width - 48)
    }
}

struct TableHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TableHeaderView()
    }
}
