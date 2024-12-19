//
//  FetchData.swift
//  API
//
//  Created by Roy David (student LM) on 12/16/24.
//

import Foundation

struct FetchData{
    var response: Response = Response()
    
    mutating func getData() async{
        let URLString = "https://api.disneyapi.dev/character"
        
        guard let url = URL(string: URLString) else {return}
        let(data, _) = try! await URLSession.shared.data(from: url)
        response = try! JSONDecoder().decode(Response.self, from: data)
        
        let dataString = String(data: data, encoding: .utf8)
        print(dataString ?? " ")
        
        
    }
}

struct Response: Codable{
    var Info: info = info()
    var data: [data] = []
}

struct data: Codable{
    var film: [String]?
    var shortFilms: [String]?
    var tvShows: [String]?
    var videoGames: [String]?
    var parkAttractions: [String]?
    var allies: [String]?
    var enemies: [String]?
    var name: String?
    var imageURL: URL?
    var createdAt: String?
    var updatedAt: String?
}

extension data: Identifiable{
    var id: Int {nil ?? 0}
}

struct info: Codable{
    var count: Int?
    var totalPages: Int?
}


