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
        user.name = "qada"
        user.password = "qew"
        DBHelper.getDBHelper().insertUser(user)
        if let user2 = DBHelper.getDBHelper().selectUser(15){
            print(user2.name + " " + user2.password + " " + String(user2.ID))
        } else {
            print("nilia")
        }
        let topic = Topic()
        topic.topic = "rand"
        DBHelper.getDBHelper().insertTopic(topic)
        if let topic2 = DBHelper.getDBHelper().selectTopic(100) {
            print(topic2.topic + " " + String(topic2.ID))
        } else {
            print("nillia esec")
        }
        if let user3 = DBHelper.getDBHelper().selectUser(user.name, password: user.password) {
            print(user3.name + " " + user3.password + " " + String(user3.ID))
        } else {
            print("nilia")
        }
        
        
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
    
    func selectUser(userId: Int) -> User?
    {
        let user = User()
        if let rs = database.executeQuery("select * from Users where userId = " + String(userId),
            withArgumentsInArray: nil) {
                var found = false
                while rs.next() {
                    found = true
                    user.ID = Int(rs.intForColumn("userId"))
                    user.name =  rs.stringForColumn("name")
                    user.password =  rs.stringForColumn("password")
                }
                if (!found) {
                    return nil
                }
        }
        return user
    }
    
    
    func selectUser(name: String, password: String) -> User? {
        let user = User()
        if let rs = database.executeQuery("select * from Users where name = \"" + name + "\" AND " +
            "password = \"" + password + "\"", withArgumentsInArray: nil) {
                var found = false
                while rs.next() {
                    found = true
                    user.ID = Int(rs.intForColumn("userId"))
                    user.name =  rs.stringForColumn("name")
                    user.password =  rs.stringForColumn("password")
                }
                if !found {
                    return nil
                }
        }
        return user
    }
    
    func insertTopic(topic: Topic)
    {
        let isInserted = database.executeUpdate("INSERT INTO Topics (topic) VALUES (?)",
            withArgumentsInArray: [topic.topic])
        if !isInserted {
            print("insert in topic table failed: \(database!.lastErrorMessage())")
            return
        }
        // todo let topicID =  Int(database.lastInsertRowId())
    }
    
    func selectTopic(topicId: Int) -> Topic?
    {
        let topic = Topic()
        if let rs = database.executeQuery("select * from Topics where topicId = " + String(topicId),
            withArgumentsInArray: nil) {
                var found = false
                while rs.next() {
                    found = true
                    topic.ID = Int(rs.intForColumn("topicId"))
                    topic.topic =  rs.stringForColumn("topic")
                }
                if !found {
                    return nil
                }
                
        }
        return topic
    }
    
    func insertQuestion(question: Question) {
        let isInserted = database.executeUpdate("INSERT INTO Questions (image, topicId) VALUES (?, ?)", withArgumentsInArray: [question.image, question.topic.ID])
        if !isInserted {
            print("insert in question table failed: \(database!.lastErrorMessage())")
            return
        }
        let questionId =  Int(database.lastInsertRowId())
        for (_, element) in question.answers.enumerate() {
            insertIntoAnswers(element, questionID: questionId)
        }
    }
    
    
    func insertHighScore(highScore: HighScore){
        let isInserted = database.executeUpdate("INSERT INTO Highscores (userId, score, time) VALUES (?, ?, ?)", withArgumentsInArray: [highScore.user.ID, highScore.score,highScore.time])
        if !isInserted {
            print("insert 1 table failed: \(database!.lastErrorMessage())")
            return
        }
    }
    
    func selectHighScoresByUserID(userID: Int) -> [HighScore] {
        var highScores = [HighScore]()
        if let user = selectUser(userID){
            if let rs = database.executeQuery("select * from Highscores where userID = " + String(userID), withArgumentsInArray: nil) {
                while rs.next() {
                    let highScore = HighScore()
                    highScore.ID = Int(rs.intForColumn("highscoreId"))
                    highScore.user =  user
                    highScore.score =  Int(rs.intForColumn("score"))
                    highScore.time =  Int(rs.intForColumn("time"))
                    highScores.append(highScore)
                }
            }
        }
        return highScores
    }
    
    func selectTopNumberHighScores(number: Int) -> [HighScore] {
        var highScores = [HighScore]()
        if let rs = database.executeQuery("select * from Highscores order by score desc,time asc limit " + String(number), withArgumentsInArray: nil) {
            while rs.next() {
                let highScore = HighScore()
                highScore.ID = Int(rs.intForColumn("highscoreId"))
                let userID = Int(rs.intForColumn("userID"))
                highScore.user = selectUser(userID)!
                highScore.score =  Int(rs.intForColumn("score"))
                highScore.time =  Int(rs.intForColumn("time"))
                highScores.append(highScore)
            }
            
        }
        return highScores
    }
    
    
    func insertIntoErrors(error: Error){
        let isInserted = database.executeUpdate("INSERT INTO Errors (userId, questionId) VALUES (?, ?)", withArgumentsInArray: [error.user.ID, error.question.ID])
        if !isInserted {
            print("insert 1 table failed: \(database!.lastErrorMessage())")
            return
        }
    }
    
    func insertIntoAnswers(answer: Answer, questionID: Int){
        let isInserted = database.executeUpdate("INSERT INTO Answers (questionId, answer, isTrue) VALUES (?, ?, ?)", withArgumentsInArray: [questionID,answer.answer,answer.isTrue])
        if !isInserted {
            print("insert 1 table failed: \(database!.lastErrorMessage())")
            return
        }
    }
    
    func selectAnswersByQuestionID(questionID: Int) -> [Answer]{
        var answers = [Answer]()
        if let rs = database.executeQuery("select * from Answers where questionID = " + String(questionID), withArgumentsInArray: nil) {
            while rs.next() {
                let answer = Answer()
                answer.ID = Int(rs.intForColumn("answerID"))
                answer.answer =  rs.stringForColumn("answer")
                answer.isTrue =  Int(rs.intForColumn("isTrue")) == 1
                answers.append(answer)
            }
        }
        return answers
    }
    
    func closeDb(){
        database!.close()
    }
}
