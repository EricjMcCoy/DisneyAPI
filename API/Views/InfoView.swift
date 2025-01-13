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
                .foregroundColor(Color.backgroundGreen)
                .edgesIgnoringSafeArea(.all)
            VStack{
                ZStack{
                    Rectangle()
                        .cornerRadius(70)
                        .foregroundColor(Color.buttonmain)
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
                    .font(Constants.mainBigFont)
                    .bold()
                    .underline()
                    .padding()
                    
                HStack{
                    Text("Type: " + (comp.type ?? "aaaa"))
                        .font(Constants.mainFont)
                        .padding()
                    
                    Spacer()
                }
                    
                HStack{
                    Text("Country: " + (comp.area?.name ?? "aaaaa"))
                        .font(Constants.mainFont)
                        .padding()
                    
                    Spacer()
                }
                
                    if(comp.area?.flag != nil){
                        AsyncImage(url: comp.area?.flag)
                    }
                    
                  
                HStack{
                    if(comp.cuttentSeason?.winner?.name == nil){
                        Text("Winner: Undecided")
                            .font(Constants.mainFont)
                            .padding()
                    }
                    
                    else{
                        Text("Winner: " + (comp.cuttentSeason?.winner?.name ?? " "))
                            .font(Constants.mainFont)
                            .padding()
                        
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
