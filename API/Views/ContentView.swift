//
//  ContentView.swift
//  API
//
//  Created by Eric McCoy (student LM) on 12/16/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var block: FetchData = FetchData()
    
    var body: some View {
        ScrollView{
            Text("\(block.response.num_results)")
            }.task {
                await block.getData()
            }
        }
    }


#Preview {
    ContentView()
}
