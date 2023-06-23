//
//  PredatorDetails.swift
//  JP Apex Predators
//
//  Created by Matt Maher on 6/22/23.
//

import SwiftUI

struct PredatorDetails: View {
    
    let predator: ApexPredator
    
    var body: some View {
        Text("You are viewing details about \(predator.name)")
    }
}

// struct PredatorDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        PredatorDetails()
//    }
// }
