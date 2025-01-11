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
        let URLString = "https://api.football-data.org/v4/competitions/"
        
        guard let url = URL(string: URLString) else {return}
        let(data, _) = try! await URLSession.shared.data(from: url)
        response = try! JSONDecoder().decode(Response.self, from: data)
        
        let dataString = String(data: data, encoding: .utf8)
        print(dataString ?? " ")
        
        
    }
}

struct Response: Codable{
    var count: Int = 0
    var competitions: [Competitions] = []
    
}

struct Competitions: Codable{
    var area: Area?
    var name: String?
    var code: String?
    var type: String?
    var emblem: URL?
    var plan: String?
    var cuttentSeason: CurrentSeason?
}

extension Competitions: Identifiable{
    var id: String {name ?? " "}
}

struct Area: Codable{
    var name: String?
    var code: String?
    var flag: URL?
    var numberOfAvailableSeasons: Int?
    var lastUpdated: String?
}

extension Area: Identifiable{
    var id: String {name ?? " "}
}

struct CurrentSeason: Codable{
    var startDate: String?
    var endDate: String?
    var currentMatchday: Int?
    var winner: Winner?
}

extension CurrentSeason: Identifiable{
    var id: String {startDate ?? " "}
}

struct Winner: Codable{
    var name: String?
    var crest: URL?
}

extension Winner: Identifiable{
    var id: String {name ?? " "}
}





