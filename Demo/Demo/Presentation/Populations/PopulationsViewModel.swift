import Combine
import Foundation
import Swapi

class PopulationsViewModel: ObservableObject {
    @Published var planetsPopulation: [PlanetPopulation] = []

    func fetchPlanetsPopulation() {
        if !planetsPopulation.isEmpty {
            return
        }

        let swapiClient = SwapiClient()

        swapiClient.getPlanetsPopulation { planetsPopulation in
            self.planetsPopulation = planetsPopulation
        } onFailure: { error in
            print(error.localizedDescription)
        }
    }
}
