//
//  PredatorController.swift
//  JP Apex Predators
//
//  Created by Matt Maher on 6/22/23.
//

import Foundation

class PredatorController {
    var apexPredators: [ApexPredator] = []
    private var allPredators: [ApexPredator] = []
    let typeFilters = ["All", "Land", "Air", "Sea"]

    init() {
        decodeApexPredatorData()
        apexPredators = allPredators
    }

    func decodeApexPredatorData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allPredators = try decoder.decode([ApexPredator].self, from: data)
            } catch {
                print("Error decoding JSON data: \(error)")
            }
        }
    }

    func typeIcon(for type: String) -> String {
        switch type {
        case "All":
            return "square.stack.3d.up.fill"
        case "Land":
            return "leaf.fill"
        case "Air":
            return "wind"
        case "Sea":
            return "drop.fill"
        default:
            return "questionmark"
        }
    }

    func filterBy(type: String) {
        switch type {
        case "Land", "Air", "Sea":
            apexPredators = allPredators.filter { $0.type.lowercased() == type.lowercased() }
        default:
            apexPredators = allPredators
        }
    }

    func sortByAlphabetical() {
        allPredators.sort(by: { $0.name < $1.name })
        apexPredators.sort(by: { $0.name < $1.name })
    }

    func sortByMovieAppearance() {
        allPredators.sort(by: { $0.id < $1.id })
        apexPredators.sort(by: { $0.id < $1.id })
    }
}
