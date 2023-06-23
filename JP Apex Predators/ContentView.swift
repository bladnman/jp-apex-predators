//
//  ContentView.swift
//  JP Apex Predators
//
//  Created by Matt Maher on 6/22/23.
//

import SwiftUI

struct ContentView: View {
    let apController = PredatorController()
    @State var sortAlphabetically = false

    var body: some View {
        if sortAlphabetically {
            apController.sortByAlphabetical()
        } else {
            apController.sortByMovieAppearance()
        }

        return NavigationView {
            List {
                ForEach(apController.apexPredators) { predator in
                    NavigationLink(destination: PredatorDetails(predator: predator)) {
                        PredatorRow(predator: predator)
                    }
                }
            }
            .navigationTitle("Apex Predators")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        sortAlphabetically.toggle()
                    } label: {
                        if sortAlphabetically {
                            Image(systemName: "film")
                        } else {
                            Image(systemName: "textformat")
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
