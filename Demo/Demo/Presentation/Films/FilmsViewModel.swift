import Combine
import Foundation
import Swapi

class FilmsViewModel: ObservableObject {
    @Published var films: [Film] = []

    func fetchFilms() {
        if !films.isEmpty {
            return
        }

        let swapiClient = SwapiClient()

        swapiClient.getFilms { films in
            self.films = films
        } onFailure: { error in
            print(error.localizedDescription)
        }
    }
}
