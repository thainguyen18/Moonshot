//
//  AstronautView.swift
//  Moonshot
//
//  Created by Thai Nguyen on 11/12/19.
//  Copyright © 2019 Thai Nguyen. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    let missions: [Mission]
    
    init(astronaut: Astronaut, missions: [Mission]) {
        self.astronaut = astronaut
        
        var matches = [Mission]()
        
        for mission in missions {
            if let _ = mission.crew.first(where: {$0.name == astronaut.id}) {
                matches.append(mission)
            }
        }
        
        self.missions = matches
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)

                    Text(self.astronaut.description)
                        .padding()
                    .layoutPriority(1)
                    
                    ForEach(self.missions) { mission in
                        HStack {
                            Image(mission.image)
                            .resizable()
                            .scaledToFit()
                                .frame(height: 80)
                        }
                    }
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[1], missions: missions)
    }
}
