//
//  Error.swift
//  PravaProject
//
//  Created by Nikoloz on 1/9/16.
//  Copyright © 2016 FreeuniPravaTeam. All rights reserved.
//

import Foundation

public class Error {
    
    var ID: Int!
    var question: Question!
    var user: User!
    
    func toString() -> String{
        return "ID=" + String(ID) + " question=" + question.toString() + " user=" + user.toString()
    }
    
}
