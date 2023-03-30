//
//  DetailView.swift
//  MVVM
//
//  Created by Thibault GODEFROY on 27/03/2023.
//

import SwiftUI

struct DetailView: View {
    let weather: Weather
    var body: some View {
        HStack{
            Image(systemName: weather.image)
            Text(weather.name)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(weather: Weather(name: "", image: ""))
    }
}
