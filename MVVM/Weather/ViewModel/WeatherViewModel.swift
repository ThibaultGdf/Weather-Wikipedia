//
//  MeteoViewModel.swift
//  MVVM
//
//  Created by Thibault GODEFROY on 27/03/2023.
//

import Foundation

class WeatherViewModel : ObservableObject {
    @Published var weathers : [Weather] = [
        Weather(name: "Sun", image: "sun.max.fill"),
        Weather(name: "Cloud", image: "cloud.fill"),
        Weather(name: "Storm", image: "cloud.heavyrain"),
        Weather(name: "Moon", image: "moon.fill"),
        Weather(name: "Snow", image: "snowflake"),
        Weather(name: "Tornado", image: "tornado")
    ]
    func delete(at offsets: IndexSet) {
            weathers.remove(atOffsets: offsets)
        }
}
