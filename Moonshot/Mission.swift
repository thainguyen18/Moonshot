//
//  Mission.swift
//  Moonshot
//
//  Created by Thai Nguyen on 11/12/19.
//  Copyright © 2019 Thai Nguyen. All rights reserved.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
    
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    var crewNames: String {
        var names = ""
        
        let mappedNames = self.crew.map { crew in
            astronauts.first(where: {crew.name == $0.id})
        }
        
        for i in 0 ..< mappedNames.count {
            if i == mappedNames.count - 1{
                names += mappedNames[i]!.name
            } else {
                names += mappedNames[i]!.name + ", "
            }
        }
        
        return names
    }
}
