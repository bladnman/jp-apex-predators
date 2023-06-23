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
    @State var currentTypeFilter = "All"
    @State var currentMovieFilter = "Any"

    var body: some View {
        apController.filterData(typeFilter: currentTypeFilter,
                                movieFilter: currentMovieFilter)

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
                        withAnimation {
                            sortAlphabetically.toggle()
                        }
                    } label: {
                        if sortAlphabetically {
                            Image(systemName: "list.number")
                        } else {
                            Image(systemName: "textformat.abc")
                        }
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Picker("Filter", selection: $currentTypeFilter.animation()) {
                            ForEach(apController.typeFilters, id: \.self) { type in
                                HStack {
                                    Text(type)

                                    Spacer()

                                    Image(systemName: apController.typeIcon(for: type))
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Picker("Movies", selection: $currentMovieFilter.animation()) {
                            ForEach(apController.movieFilters, id: \.self) { movie in
                                Text(movie)
                            }
                        }
                    } label: {
                        Image(systemName: "film")
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
