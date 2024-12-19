//
//  ContentView.swift
//  API
//
//  Created by Eric McCoy (student LM) on 12/16/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var block: FetchData = FetchData()
    @State var Name: String = " "
    
    var body: some View {
        ScrollView{
            VStack {
                Text(block.response.title)
            }
        }
        .task {
            await block.getData()
        }
        }
    }


#Preview {
    ContentView()
}
