//
//  HighScore.swift
//  PravaProject
//
//  Created by Nikoloz on 1/9/16.
//  Copyright © 2016 FreeuniPravaTeam. All rights reserved.
//

import Foundation

public class HighScore {
    
    var ID: Int!
    var user: User!
    var score: Int!
    var time: Int!
    
    func toString() -> String {
        return "ID=" + String(ID) + " User=" + user.toString() + " score=" + String(score) + " time=" + String(time)
    }
    
}
