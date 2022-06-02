import SwiftUI


struct ContentView: View {
    
    @State var teamOne: String = ""
    @State var teamTwo: String = ""
    @EnvironmentObject var points:Points
    
    struct TeamName: View {
        var title: String
        var teamName: Binding<String>
        var body: some View {
            VStack {
                Text("\(title):")
                TextField(title, text: teamName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
             }
        }
    }
    
    
    @ViewBuilder
    var content: some View {
        TeamName(title: "Team One", teamName: $teamOne)
        TeamName(title: "Team Two", teamName: $teamTwo)
        
        VStack{
            Stepper("Number of Sets", value: $points.numberOfSets, in:1...7)
            Text("The game will have \(points.numberOfSets) sets")
        }
        Spacer()
        NavigationLink(destination:
                        GameScreen(teamOne: teamOne,
                                   teamTwo: teamTwo).onAppear {
            print(points.teamOneSetPoints)
        }
        ) {
            VStack {
                Image("Image")
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.red.edgesIgnoringSafeArea(.all)
                VStack {
                    content.padding(38)
                }
            }
        }
    }
}
