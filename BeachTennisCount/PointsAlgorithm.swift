//
//  PointsAlgorithm.swift
//  BeachTennisCount
//
//  Created by Bruno Sabadini on 29/03/22.
//

import Foundation

class Points: ObservableObject {
    
    @Published var teamOneSetPoints: Int = 0
    @Published var teamTwoSetPoints: Int = 0
    @Published var playAgain: Bool? = false
//    {didSet{print(playAgain)}}
    @Published var teamOnegamePoints: Int = 0
    @Published var teamTwogamePoints: Int = 0
    @Published var numberOfSets: Int = 3
    @Published var whoWon: String = ""
    @Published var photo: String = ""

    var setCountTeamOne:String? {String(teamOneSetPoints)}
    var gameCountTeamOne:String? {String(teamOnegamePoints)}
    
    var setCountTeamTwo:String? {String(teamTwoSetPoints)}
    var gameCountTeamTwo:String? {String(teamTwogamePoints)}
    
    
    func oneScores() {
        if teamOnegamePoints == numberOfSets && teamOneSetPoints == 40 {
            whoWon = "oneWon"
            playAgain = true
            print(playAgain)
        }
        else if teamOnegamePoints <= numberOfSets && teamOneSetPoints == 0 {
            teamOneSetPoints+=15
        }
        else if teamOnegamePoints <= numberOfSets && teamOneSetPoints == 15 {
            teamOneSetPoints+=15
        }
        else if teamOnegamePoints <= numberOfSets && teamOneSetPoints == 30 {
            teamOneSetPoints+=10
        }
        else if teamOnegamePoints <= numberOfSets && teamOneSetPoints == 40 {
            teamOnegamePoints+=1
            teamOneSetPoints = 0
        }
    }
    
//    func pickPhoto() {
//       photo = teamOne
//    }
    
    func twoScores() {
        if teamTwogamePoints == numberOfSets && teamTwoSetPoints == 40 {
            playAgain = true
            print(playAgain)
        }
        else if teamTwogamePoints <= numberOfSets && teamTwoSetPoints == 0 {
            teamTwoSetPoints+=15
        }
        else if teamTwogamePoints <= numberOfSets && teamTwoSetPoints == 15 {
            teamTwoSetPoints+=15
        }
        else if teamTwogamePoints <= numberOfSets && teamTwoSetPoints == 30 {
            teamTwoSetPoints+=10
        }
        else if teamTwogamePoints <= numberOfSets && teamTwoSetPoints == 40 {
            teamTwogamePoints+=1
            teamTwoSetPoints = 0

        }
    }
    
    
    func teamOneSetPointsDecrease() {
        if teamOneSetPoints == 0 {
            teamOnegamePoints -= 1
            teamOneSetPoints = 40
        }
        else if teamOneSetPoints == 15 || teamOneSetPoints == 30 {
            teamOneSetPoints -= 15
        }
        else { teamOneSetPoints -= 10
    }
    }
    
    func teamTwoSetPointsDecrease() {
        if teamTwoSetPoints == 0 {
            teamTwogamePoints -= 1
            teamTwoSetPoints = 40
        }
        else if teamTwoSetPoints == 15 || teamTwoSetPoints == 30 {
            teamTwoSetPoints -= 15
        }
        else { teamTwoSetPoints -= 10
    }    }
    
    func resetGame() {
        teamOneSetPoints = 0
        teamTwoSetPoints = 0
        playAgain = false
        teamOnegamePoints = 0
        teamTwogamePoints = 0
        whoWon = ""
    }
}
