//
//  Topic.swift
//  PravaProject
//
//  Created by Sandro on 1/9/16.
//  Copyright © 2016 FreeuniPravaTeam. All rights reserved.
//

import Foundation


public class Topic {

    var ID: Int!
    var topic: String!
    
    func toString() -> String {
        return " ID= " + String(ID) + " topic=" + topic
    }
    
}
