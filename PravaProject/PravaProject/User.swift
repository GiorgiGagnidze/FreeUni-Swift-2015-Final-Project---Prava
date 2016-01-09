//
//  User.swift
//  PravaProject
//
//  Created by Sandro on 1/9/16.
//  Copyright © 2016 FreeuniPravaTeam. All rights reserved.
//

import Foundation


public class User {
    
    var ID: Int!
    var name: String!
    var password: String!
    
    func toString() -> String {
        return "ID=" + String(ID) + " Name=" + name + " Password" + password
    }
    
}