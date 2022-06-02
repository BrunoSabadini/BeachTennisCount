//
//  GameScreen.swift
//  BeachTennisCount
//
//  Created by Bruno Sabadini on 24/03/22.
//

import SwiftUI
import Combine

struct PlayersPhotos: View {
    @EnvironmentObject var image:Points
    var body: some View {
        HStack{
            Image(image.photo)
                .resizable()
            Image(image.photo)
                .resizable()
        }
    }
}


struct GameScreen: View {
    
    var teamOne: String
    var teamTwo: String
    @EnvironmentObject var points:Points

    
    var body: some View {
        ZStack {
            NavigationLink("", isActive: Binding<Bool>.init(get: {
                points.playAgain
            }, set: { _ in})) {
                ScoreScreen(winner: points.whoWon == "oneWon" ? teamOne : teamTwo)
            }
            
            VStack {
                HStack{
                    Spacer()
                    Text(points.setCountTeamOne!)
                    Text(points.gameCountTeamOne!)
                    Spacer()
                    Text(points.setCountTeamTwo!)
                    Text(points.gameCountTeamTwo!)
                    Spacer()
                }
                HStack{
                    VStack {
                        Button {
                            points.oneScores()
                        } label: {
                            Image("Beach")
                                .resizable()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(PlayersPhotos())
                               
                        }
                        Text("Hold to decrease count")
                            .onLongPressGesture(minimumDuration: 1) {
                                points.teamOneSetPointsDecrease()
                    }
                    }
                    VStack {
                        Button {
                            points.twoScores()
                        } label: {
                            Image("Beach").resizable()
                                .background(Color.red)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                            Text("\(teamTwo)")
                                
                        }
                        Text("Hold to decrease count")
                            .onLongPressGesture(minimumDuration: 1) {
                                points.teamTwoSetPointsDecrease()
                    }
            }
        }
        
    }
}
}
}
