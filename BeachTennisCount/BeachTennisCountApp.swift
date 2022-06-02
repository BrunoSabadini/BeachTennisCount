//
//  BeachTennisCountApp.swift
//  BeachTennisCount
//
//  Created by Bruno Sabadini on 23/03/22.
//

import SwiftUI

@main
struct BeachTennisCountApp: App {
    var userData = Points()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(userData)
        }
    }
}
