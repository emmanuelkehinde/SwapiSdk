import Combine
import Foundation
import Swapi

class EyeColorsViewModel: ObservableObject {
    @Published var eyeColors: [PersonEyeColor] = []

    func fetchEyeColors() {
        if !eyeColors.isEmpty {
            return
        }

        let swapiClient = SwapiClient()

        swapiClient.getEyeColors { eyeColors in
            self.eyeColors = eyeColors
        } onFailure: { error in
            print(error.localizedDescription)
        }
    }
}
