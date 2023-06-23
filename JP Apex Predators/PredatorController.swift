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
    var movieFilters: [String] = ["Any"]

    init() {
        decodeApexPredatorData()
        apexPredators = allPredators

        // set up the unique movie list
        let moviesSet: Set<String> = ["Any"]
        movieFilters = allPredators.reduce(moviesSet) { result, predator in
            result.union(predator.movies)
        }.sorted()
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

    func filterData(typeFilter: String, movieFilter: String) {
        // start with all
        apexPredators = allPredators

        // TYPE
        if ["Land", "Air", "Sea"].contains(typeFilter) {
            apexPredators = apexPredators.filter {
                $0.type.lowercased() == typeFilter.lowercased()
            }
        }

        // MOVIE
        if movieFilter != "Any" {
            apexPredators = apexPredators.filter {
                $0.movies.contains(movieFilter)
            }
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
