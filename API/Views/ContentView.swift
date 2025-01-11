//
//  ContentView.swift
//  API
//
//  Created by Eric McCoy (student LM) on 12/16/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var block: FetchData = FetchData()
    @State var page: Bool = false
    @State var Comps: Competitions = Competitions()
    var body: some View {
        ZStack{
            if(page){
                Rectangle()
                    .foregroundColor(.red)
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                        Button(action: {
                            page = false
                        }, label: {
                            Text("Back")
                        })
                    InfoView(comp: $Comps)
                }
            }
            else{
                ScrollView{
                    ForEach(block.response.competitions){ comp in
                        Button(action: {
                            Comps = comp
                            page = true
                        }, label: {
                            ZStack{
                                Rectangle()
                                    .frame(width: 350)
                                    .foregroundColor(.gray)
                                    .cornerRadius(10)
                                VStack{
                                    if(comp.emblem != nil){
                                        AsyncImage(url: comp.emblem)
                                            .padding()
                                    }
                                    
                                    Text(comp.name ?? " ")
                                        .font(.title)
                                        .bold()
                                        .padding()
                                }
                            }
                        })
                    }
                }
                .padding()
                .task {
                    await block.getData()
                }
            }
        }
    }
    }


#Preview {
    ContentView()
}
