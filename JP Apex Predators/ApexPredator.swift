//
//  ApexPredator.swift
//  JP Apex Predators
//
//  Created by Matt Maher on 6/22/23.
//

import Foundation
import SwiftUI

struct ApexPredator: Codable, Identifiable {
    let id: Int
    let name: String
    let type: String
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String

    func imageName() -> String {
        return name.lowercased().filter { $0 != " " }
    }

    func typeOverlay() -> Color {
        switch type {
        case "land":
            return .brown
        case "air":
            return .teal
        case "sea":
            return .blue

        default:
            return .blue
        }
    }
}

struct MovieScene: Codable, Identifiable {
    let id: Int
    let movie: String
    let sceneDescription: String
}
