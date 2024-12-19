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
            VStack {
                Text(block.response.title)
                    .font(.title)
                
                AsyncImage(url: block.response.url){
                    phase in
                    switch phase{
                    case.failure:
                        Image("fnf")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .padding()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .padding()
                    default:
                        ProgressView()
                    }
                }
                
                Text(block.response.explanation)
                    .padding()
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
