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
        let URLString = "https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=5630aEipCU2Kv7UDWXgkrWCrQmK0VYHz"
        
        guard let url = URL(string: URLString) else {return}
        let(data, _) = try! await URLSession.shared.data(from: url)
        response = try! JSONDecoder().decode(Response.self, from: data)
        
        let dataString = String(data: data, encoding: .utf8)
        print(dataString ?? " ")
        
        
    }
}

struct Response: Codable{
    //var copyright: String = ""
    var num_results: Int = 0
    //var last_modified: String = ""
    //var results: [Results] = []
}

struct Results: Codable{
    var list_name: String?
    var books: [Books]
}

extension Results: Identifiable{
    var id: String {list_name ?? " "}
}

struct Books: Codable{
    var rank: Int?
    var rank_last_week: Int?
    var weeks_on_list: Int?
    var asterisk: Int?
    var publisher: String?
    var description: String?
    var title: String?
    var author: String?
    var book_image: URL?
}

extension Books: Identifiable{
    var id: String {title ?? " "}
}
