//
//  ParsingViewModel.swift
//  MVVM
//
//  Created by Thibault GODEFROY on 28/03/2023.
//

import Foundation

class ParsingViewModel: ObservableObject {
    @Published var wiki: Wiki = Wiki(query: Query(pages: ["" : Page(pageid: 0, ns: 0, title: "", index: 0, extract: "")]))
    @Published var searchText : String = ""
    
    var baseUrl : String = "https://fr.wikipedia.org/w/api.php?action=query&format=json&"
    
    func getInformationWikipedia(query: String, responseLimit: Int) async throws -> Wiki {
        let newText = query.replacingOccurrences(of: " ", with: "_", options: .literal, range: nil)
        guard let url = URL(string: "\(baseUrl)generator=search&gsrnamespace=0&gsrlimit=\(responseLimit)&gsrsearch='\(newText)'")
        else {
            fatalError("Missing URL")
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200
        else {
            fatalError("Error while fetching data")
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decoded = try decoder.decode(Wiki.self, from: data)
        
        return decoded
    }
    
    func getInformationDetail(id: Int) async throws -> Wiki {
        guard let url = URL(string: "\(baseUrl)prop=extracts&explaintext&pageids=\(id)")
        else {
            fatalError("Missing URL")
        }
        print(url)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200
        else {
            fatalError("Error while fetching data")
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let search = try decoder.decode(Wiki.self, from: data)
        print(search)
        return search
    }
}
