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
            Image(imageNameFor(predator: predator))
                .resizable()
                .scaledToFit()
                .frame(width: 75)
                .padding(.trailing)
            VStack(alignment: .leading) {
                Text(predator.name)
                    .bold()
                Text(predator.type.capitalized)
                    .font(.subheadline)
                    .bold()
                    .padding(.horizontal, 10)
                    .padding(.vertical, 3)
                    .background(.brown.opacity(0.5))
                    .cornerRadius(50)
            }
        }
    }

    func imageNameFor(predator: ApexPredator) -> String {
        let lowercasedString = predator.name.lowercased()
        return lowercasedString.replacingOccurrences(of: " ", with: "")
    }
}

// struct PredatorRow_Previews: PreviewProvider {
//    static var previews: some View {
//        PredatorRow()
//    }
// }
