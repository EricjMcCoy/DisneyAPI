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
        let URLString = "https://api.nasa.gov/planetary/apod?api_key=WZddIAQWjjWG87oLXVSTxSbJcrxaLbnpKRQReOzP"
        
        guard let url = URL(string: URLString) else {return}
        let(data, _) = try! await URLSession.shared.data(from: url)
        response = try! JSONDecoder().decode(Response.self, from: data)
        
        let dataString = String(data: data, encoding: .utf8)
        print(dataString ?? " ")
        
        
    }
}

struct Response: Codable{
    var date: String = " "
    var explanation: String = " "
    var hdurl: URL?
    var media_type: String = " "
    var service_version: String = " "
    var title: String = " "
    var url: URL?
}



