//
//  PredatorRow.swift
//  JP Apex Predators
//
//  Created by Matt Maher on 6/22/23.
//

import SwiftUI

struct PredatorRow: View {
    let predator: ApexPredator

    var body: some View {
        HStack {
            Image(predator.imageName())
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
                .padding(.trailing)
                .shadow(color: .white, radius: 1, x: 0, y: 0)
            VStack(alignment: .leading) {
                Text(predator.name)
                    .bold()
                Text(predator.type.capitalized)
                    .font(.subheadline)
                    .bold()
                    .padding(.horizontal, 13)
                    .padding(.vertical, 5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(predator.typeOverlay().opacity(0.33))
                    )
//                    .background(.brown.opacity(0.5))
//                    .cornerRadius(50)
            }
        }
    }
}

struct PredatorRow_Previews: PreviewProvider {
    static var previews: some View {
        PredatorRow(predator: samplePredator)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
