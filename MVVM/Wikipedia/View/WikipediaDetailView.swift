//
//  WikipediaDetailView.swift
//  MVVM
//
//  Created by Thibault GODEFROY on 29/03/2023.
//

import SwiftUI

struct WikipediaDetailView: View {
    @ObservedObject var viewModel = ParsingViewModel()
    var wikiId: Int
    var body: some View {
        VStack{
            Text(viewModel.wiki.query.pages.values.first!.title)
            ScrollView(showsIndicators: false) {
                Text(viewModel.wiki.query.pages.values.first!.extract!)
            }
                    .onAppear {
                        Task {
                            viewModel.wiki = try await viewModel.getInformationDetail(id: wikiId)
                        }
                    }
        }
    }
}

struct WikipediaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WikipediaDetailView(wikiId: 41893)
    }
}
