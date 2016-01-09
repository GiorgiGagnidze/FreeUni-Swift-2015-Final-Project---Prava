//
//  DBHelper.swift
//  PravaProject
//
//  Created by MAC  on 1/9/16.
//  Copyright © 2016 FreeuniPravaTeam. All rights reserved.
//

import Foundation

public class DBHelper : NSObject {
    private static var db:DBHelper!
    var database: FMDatabase!
    static func getDBHelper() -> DBHelper{
        if(db == nil){
            db = DBHelper()
        }
        return db
    }
    
    var dbPath:String?
    
    private override init(){
        super.init()
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        dispatch_async(queue, {
            
            let documentsFolder = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
            let path =   NSURL(fileURLWithPath: documentsFolder).URLByAppendingPathComponent("Prava.sqlite")
            self.dbPath = path.description
            print(path.description)
            
            self.database = FMDatabase(path: path.description)
            
            if !self.database.open() {
                print("Unable to open database")
                return
            }else{
                print("database opened")
            }
            self.addTables()
        })
        
    }
    
    
    private func addTables(){
        addTable("Users", query: "create table Users(userId  INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE, name text, password text)")
        
        addTable("Topics", query: "create table Topics(topicId  INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE, topic text)")
        
        addTable("Questions", query: "create table Questions(questionId  INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE, image text, topicId INTEGER, FOREIGN KEY(topicId) REFERENCES Topics(topicId))")
        
        addTable("Errors", query: "create table Errors(errorId  INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE, userId INTEGER, questionId INTEGER, FOREIGN KEY(userId) REFERENCES Users(userId), FOREIGN KEY(questionId) REFERENCES Questions(questionId))")
        
        addTable("Answers", query: "create table Answers(answerId  INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE, questionId INTEGER, answer text, isTrue INTEGER, FOREIGN KEY(questionId) REFERENCES Questions(questionId))")
        
        addTable("Highscores", query: "create table Highscores(highscoreId  INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE, userId INTEGER, score INTEGER, time INTEGER, FOREIGN KEY(userId) REFERENCES Users(userId))")
        
        let user = User()
        user.name = "niko"
        user.password = "pw"
        DBHelper.getDBHelper().insertUser(user)
        let user2 = DBHelper.getDBHelper().selectUser(1)
        print(user2.name + " " + user2.password + " " + String(user2.ID))
        
    }
    
    private func addTable(tableName: String,query: String){
        if(  !self.database.tableExists(tableName )){
            if !self.database.executeUpdate(query, withArgumentsInArray: nil) {
                print("create table failed: \(self.database.lastErrorMessage())")
            }
        }
    }
    
    func insertUser(user: User)
    {
        let isInserted = database.executeUpdate("INSERT INTO Users (name, password) VALUES (?, ?)", withArgumentsInArray: [user.name, user.password])
        if !isInserted {
            print("insert 1 table failed: \(database!.lastErrorMessage())")
            return
        }
        // todo let userID =  Int(database.lastInsertRowId())
    }
    
    func selectUser(userId: Int) -> User
    {
        let user = User()
        if let rs = database.executeQuery("select * from Users where userId = " + String(userId),
            withArgumentsInArray: nil) {
            while rs.next() {
                user.ID = Int(rs.intForColumn("userId"))
                user.name =  rs.stringForColumn("name")
                user.password =  rs.stringForColumn("password")
            }
            
        }
        return user
    }

    func closeDb(){
        database!.close()
    }
}
