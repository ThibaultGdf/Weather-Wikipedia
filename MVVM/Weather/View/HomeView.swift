//
//  ParentView.swift
//  MVVM
//
//  Created by Thibault GODEFROY on 27/03/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = WeatherViewModel()
    var body: some View {
        
        NavigationStack{
            List{
                ForEach(viewModel.weathers) { weather in
                    NavigationLink(destination: DetailView(weather: weather))
                    {
                        Image(systemName: weather.image)
                        Text(weather.name)
                    }
                }.onDelete(perform: viewModel.delete)
            }
        }
    }
}

struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
