//
//  Question.swift
//  PravaProject
//
//  Created by Sandro on 1/9/16.
//  Copyright © 2016 FreeuniPravaTeam. All rights reserved.
//

import Foundation


public class Question {
    
    var ID: Int!
    var image: String!
    var topic: Topic!
    var description: String!
    var answers = [Answer]()
}