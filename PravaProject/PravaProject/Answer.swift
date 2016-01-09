//
//  Answer.swift
//  PravaProject
//
//  Created by Nikoloz on 1/9/16.
//  Copyright © 2016 FreeuniPravaTeam. All rights reserved.
//

import Foundation

public class Answer {
    
    var ID: Int!
    var answer: String!
    var isTrue: Bool!
    
    func toString() -> String {
        return "ID=" + String(ID) + " answer=" + answer + " isTrue=" + String(isTrue)
    }
    
}
