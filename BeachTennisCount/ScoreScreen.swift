//
//  ScoreScreen.swift
//  BeachTennisCount
//
//  Created by Bruno Sabadini on 24/03/22.
//

import SwiftUI


struct NavigationUtil {
    
    //Go directly to root view
    
    @EnvironmentObject var points:Points
    static func popToRootView() {
        findNavigationController(viewController: UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController)?
            .popToRootViewController(animated: true)
    }
    
    static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
        guard let viewController = viewController else {
            return nil
        }
        
        if let navigationController = viewController as? UINavigationController {
            return navigationController
        }
        
        for childViewController in viewController.children {
            return findNavigationController(viewController: childViewController)
        }
        
        return nil
    }
}

struct ScoreScreen: View {
    
    @EnvironmentObject var points:Points
    var winner: String
    var body: some View {
        VStack{
            Text("Congratulations \(winner) you won!")
            Button("Play Again") {
                points.resetGame()
                NavigationUtil.popToRootView()
            }
        }
    }
}

