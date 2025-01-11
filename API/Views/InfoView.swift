//
//  InfoView.swift
//  API
//
//  Created by Roy David (student LM) on 12/18/24.
//

import SwiftUI

struct InfoView: View {
    
    @Binding var comp: Competitions
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.red)
                .edgesIgnoringSafeArea(.all)
            VStack{
                ZStack{
                    Rectangle()
                        .cornerRadius(70)
                        .foregroundColor(.gray)
                        .scaledToFit()
                        .padding()
                    
                    if(comp.emblem == nil){
                        Image("ball")
                            .resizable()
                            .scaledToFit()
                            .padding(.all, 30.0)
                    }
                    
                    else{
                        AsyncImage(url: comp.emblem)
                    }
                }
                    
                    Text(comp.name ?? "aaaa")
                    .font(.largeTitle)
                    .bold()
                    .underline()
                    .padding()
                    
                HStack{
                    Text("Type: " + (comp.type ?? "aaaa"))
                        .font(.title)
                        .padding()
                    
                    Spacer()
                }
                    
                HStack{
                    Text("country: " + (comp.area?.name ?? "aaaaa"))
                        .font(.title)
                        .padding()
                    
                    Spacer()
                }
                
                    if(comp.area?.flag != nil){
                        AsyncImage(url: comp.area?.flag)
                    }
                    
                  
                HStack{
                    if(comp.cuttentSeason?.winner?.name == nil){
                        Text("Winner: Unknown")
                            .font(.title)
                            .padding()
                    }
                    
                    else{
                        Text("Winner: " + (comp.cuttentSeason?.winner?.name ?? " "))
                        
                        AsyncImage(url: comp.cuttentSeason?.winner?.crest)
                    }
                    
                    Spacer()
                }
                }
            }
        }
    }


#Preview {
    InfoView(comp: Binding.constant(Competitions()))
}
