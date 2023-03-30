//
//  Meteo.swift
//  MVVM
//
//  Created by Thibault GODEFROY on 27/03/2023.
//

import Foundation

struct Weather : Identifiable, Codable {
    var id = UUID()
    var name: String
    var image: String
}
