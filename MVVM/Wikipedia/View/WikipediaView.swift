//
//  WikipediaView.swift
//  MVVM
//
//  Created by Thibault GODEFROY on 28/03/2023.
//

import SwiftUI

struct WikipediaView: View {
    @StateObject var viewModel = ParsingViewModel()
    var body: some View {
        NavigationStack {
            VStack{
                if !viewModel.searchText.isEmpty {
                    List {
                        ForEach(Array(viewModel.wiki.query.pages.values), id: \.self) { page in
                            NavigationLink(destination: WikipediaDetailView(wikiId: page.pageid)) {
                                VStack(alignment: .leading){
                                    Text(page.title)
                                        .fontWeight(.regular)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Wikipédia")
            .searchable(text: $viewModel.searchText)
            .onSubmit(of: .search) {
                Task{
                    if viewModel.searchText.isEmpty {
                        viewModel.searchText = "..."
                    } else {
                        viewModel.wiki = try await viewModel.getInformationWikipedia(query: viewModel.searchText, responseLimit: 10)
                    }
                }
            }
        }
    }
}

struct WikipediaView_Previews: PreviewProvider {
    static var previews: some View {
        WikipediaView()
    }
}
