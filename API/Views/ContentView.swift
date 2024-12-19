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
                ForEach(block.response.data){ d in
                    Button(action: {
                        Name = d.name ?? "help"
                    }, label: {
                        Text(Name)
                    })
                }
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
