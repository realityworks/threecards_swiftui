//
//  CardViewHeader.swift
//  threecards
//
//  Created by Piotr Suwara on 8/11/2022.
//

import SwiftUI

struct CardViewHeader: View {
    var title: String
    var color: Color
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(20)
                .foregroundColor(color)
                .padding(.horizontal, 32)
            Text(title)
                .foregroundColor(.appForegroundBright)
                .font(.title)
        }
        //.frame(maxHeight: 100)
        .padding(.vertical, 24)
    }
}

struct CardViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        CardViewHeader(title: "TEST", color: .blue)
    }
}
