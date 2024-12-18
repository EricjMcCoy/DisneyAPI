//
//  ContentView.swift
//  API
//
//  Created by Eric McCoy (student LM) on 12/16/24.
//

import SwiftUI

struct ContentView: View {
    var data: FetchData = FetchData()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(data.response.data[1].name ?? " ")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
