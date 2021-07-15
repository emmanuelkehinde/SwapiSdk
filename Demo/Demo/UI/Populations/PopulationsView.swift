//
//  PopulationsView.swift
//  Demo
//
//  Created by Emmanuel Kehinde on 14/07/2021.
//

import SwiftUI
import Swapi

struct PopulationsView: View {
    @State private var planetsPopulation: [PlanetPopulation] = []

    var body: some View {
        NavigationView {
            ScrollView {
                if planetsPopulation.isEmpty {
                    ProgressView().padding(.top)
                } else {
                    LazyVGrid(columns: .init(repeating: .init(), count: 2), spacing: 16) {
                        ForEach(0..<planetsPopulation.count) { index in
                            populationRow(planetPopulation: planetsPopulation[index])
                        }
                    }
                    .padding(.top)
                    .padding(.horizontal)

                    Spacer()
                }
            }
            .navigationBarTitle("Planets Population")
        }
        .onAppear(perform: {
            if planetsPopulation.isEmpty {
                fetchPlanetsPopulation()
            }
        })
    }

    @ViewBuilder
    private func populationRow(planetPopulation: PlanetPopulation) -> some View {
        ZStack {
            VStack(spacing: 16) {
                HStack {
                    Spacer()

                    Text(planetPopulation.population)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                        .font(.title2)
                        .foregroundColor(Color.black)

                    Spacer()
                }


                VStack(spacing: 0) {
                    Text(planetPopulation.planetName)
                        .lineLimit(1)
                        .font(.subheadline)
                        .foregroundColor(Color.black.opacity(0.6))
                        .padding(.bottom, 8)

                    Text(planetPopulation.planetClimate)
                        .lineLimit(1)
                        .font(.caption)
                        .padding(4)
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.gray.opacity(0.3))
                        )
                }
            }
            .padding()
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .shadow(color: Color.gray.opacity(0.8), radius: 0.8)
            )
        }
    }

    private func fetchPlanetsPopulation() {
        let swapiClient = SwapiClient()

        swapiClient.getPlanetsPopulation { planetsPopulation in
            self.planetsPopulation = planetsPopulation
        } onFailure: { error in
            print(error.localizedDescription)
        }
    }
}

struct PopulationsView_Previews: PreviewProvider {
    static var previews: some View {
        PopulationsView()
    }
}
