//
//  InfoState.swift
//  API
//
//  Created by Roy David (student LM) on 12/18/24.
//

import Foundation

struct InfoState{
    var count: Int
    var totalPages: Int
    
    init(count: Int = 0, totalPages: Int = 0) {
        self.count = count
        self.totalPages = totalPages
    }
}
