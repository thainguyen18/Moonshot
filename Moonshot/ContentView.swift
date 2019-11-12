//
//  ContentView.swift
//  Moonshot
//
//  Created by Thai Nguyen on 11/12/19.
//  Copyright © 2019 Thai Nguyen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showingName = false
    
    var body: some View {
        NavigationView {
        List(missions) { mission in
            NavigationLink(destination:MissionView(mission: mission, astronauts: self.astronauts)) {
                Image(mission.image)
                .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44)
                
                VStack(alignment: .leading) {
                    Text(mission.displayName)
                        .font(.headline)
                    if self.showingName {
                        Text(mission.crewNames)
                    } else {
                        Text(mission.formattedLaunchDate)
                    }
                }
            }
        }
        .navigationBarTitle("Moonshot")
        .navigationBarItems(trailing: Button("Toggle") {
            self.showingName.toggle()
        })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
