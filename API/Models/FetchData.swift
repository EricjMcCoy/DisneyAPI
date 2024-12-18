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
        let URLString = "https://api.disneyapi.dev/character?name=Mickey%20Mouse"
        
        guard let url = URL(string: URLString) else {return}
        
    }
}

struct Response{
    var info: InfoState = InfoState()
    var data: [data] = []
}

struct data: Codable{
    var id: Int?
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


