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
    
    func toString() -> String {
        var result = " ID= " + String(ID) + " image=" + image
        let bla = topic.toString() + " desc=" + description + "\n"
        result += bla
        for (index, element) in answers.enumerate() {
            result += " answer" + String(index) + "=" + element.toString() + "\n"
        }
        return result
    }
    
}