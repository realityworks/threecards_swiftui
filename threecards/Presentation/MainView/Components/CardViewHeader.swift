//
//  CardViewHeader.swift
//  threecards
//
//  Created by Piotr Suwara on 8/11/2022.
//

import SwiftUI

struct CardViewHeader: View {
    // Model
    var title: String
    var color: Color

    // Animation
    @State private var show = false

    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(20)
                .foregroundColor(color)
                .opacity(show ? 1 : 0)
                .scaleEffect(show ? 1 : 0.2)
                .padding(.horizontal, 32)
                .animation(
                    .spring(dampingFraction: 0.4, blendDuration: 0.5)
                        .delay(0.2),
                    value: show
                )

            Text(title)
                .foregroundColor(.appForegroundBright)
                .font(.title)
                .opacity(show ? 1 : 0)
        }
        .onAppear {
            show.toggle()
        }
    }
}

struct CardViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        CardViewHeader(title: "TEST", color: .blue)
    }
}
