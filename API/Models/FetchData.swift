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
    var list_name: String?
    var books: [Books]
}
struct area






