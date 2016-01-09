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
            let path =   NSURL(fileURLWithPath: documentsFolder).URLByAppendingPathComponent("PravaDatab.sqlite")
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
        
        addTable("Questions", query: "create table Questions(questionId  INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE, image text, description text, topicId INTEGER, FOREIGN KEY(topicId) REFERENCES Topics(topicId))")
        
        addTable("Errors", query: "create table Errors(errorId  INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE, userId INTEGER, questionId INTEGER, FOREIGN KEY(userId) REFERENCES Users(userId), FOREIGN KEY(questionId) REFERENCES Questions(questionId))")
        
        addTable("Answers", query: "create table Answers(answerId  INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE, questionId INTEGER, answer text, isTrue INTEGER, FOREIGN KEY(questionId) REFERENCES Questions(questionId))")
        
        addTable("Highscores", query: "create table Highscores(highscoreId  INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE, userId INTEGER, score INTEGER, time INTEGER, FOREIGN KEY(userId) REFERENCES Users(userId))")
        
        var user1 = User()
        user1.ID = 1
        user1.name = "nikoloz"
        user1.password = "pw1"
        
        var user2 = User()
        user2.ID = 2
        user2.name = "lejava"
        user2.password = "pw2"
        
        user1 = insertUser(user1)!
        user2 = insertUser(user2)!
        
        let highscore1 = HighScore()
        highscore1.ID = 1
        highscore1.score = 8
        highscore1.time = 2
        highscore1.user = user1
        
        let highscore2 = HighScore()
        highscore2.ID = 2
        highscore2.score = 1
        highscore2.time = 8
        highscore2.user = user1
        
        let highscore3 = HighScore()
        highscore3.ID = 3
        highscore3.score = 4
        highscore3.time = 4
        highscore3.user = user2
        
        let highscore4 = HighScore()
        highscore4.ID = 4
        highscore4.score = 8
        highscore4.time = 1
        highscore4.user = user2
        
        let highscore5 = HighScore()
        highscore5.ID = 5
        highscore5.score = 8
        highscore5.time = 1
        highscore5.user = user1
    
        let highscore6 = HighScore()
        highscore6.ID = 6
        highscore6.score = 4
        highscore6.time = 5
        highscore6.user = user2
        
        insertHighScore(highscore1)
        insertHighScore(highscore2)
        insertHighScore(highscore3)
        insertHighScore(highscore4)
        insertHighScore(highscore5)
        insertHighScore(highscore6)
        
        let highscores1 = selectTopNumberHighScores(6)
        for (_, element) in highscores1.enumerate() {
            print(element.toString())
        }
        
        let highscores2 = selectHighScoresByUserID(user2.ID)
        for (_, element) in highscores2.enumerate() {
            print(element.toString())
        }
    }
    
    private func addTable(tableName: String,query: String){
        if(  !self.database.tableExists(tableName )){
            if !self.database.executeUpdate(query, withArgumentsInArray: nil) {
                print("create table failed: \(self.database.lastErrorMessage())")
            }
        }
    }
    
    // if nil is returned than user is NOT inserted
    func insertUser(user: User) -> User?
    {
        if let _ = selectUser(user.name, password: user.password) {
            return nil;
        }
        let isInserted = database.executeUpdate("INSERT INTO Users (name, password) VALUES (?, ?)", withArgumentsInArray: [user.name, user.password])
        if !isInserted {
            print("insert 1 table failed: \(database!.lastErrorMessage())")
            return nil
        }
        let userID =  Int(database.lastInsertRowId())
        let result = User()
        result.ID = userID
        result.name = user.name
        result.password = user.password
        return result
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
    
    func selectTopics() -> [Topic]
    {
        var topics = [Topic]()
        if let rs = database.executeQuery("select * from Topics",
            withArgumentsInArray: nil) {
                while rs.next() {
                    let topic = Topic()
                    topic.ID = Int(rs.intForColumn("topicId"))
                    topic.topic =  rs.stringForColumn("topic")
                    topics.append(topic)
                }
                
        }
        return topics
    }

    
    func insertQuestion(question: Question) {
        let isInserted = database.executeUpdate("INSERT INTO Questions (description, image, topicId) VALUES (?, ?, ?)", withArgumentsInArray: [question.description ,question.image, question.topic.ID])
        if !isInserted {
            print("insert in question table failed: \(database!.lastErrorMessage())")
            return
        }
        let questionId =  Int(database.lastInsertRowId())
        for (_, element) in question.answers.enumerate() {
            insertIntoAnswers(element, questionID: questionId)
        }
    }
    
    
    func selectQuestions(limitNumber: Int) -> [Question] {
        var questions = [Question]()
        if let rs = database.executeQuery("SELECT * FROM questions ORDER BY RANDOM() LIMIT " + String(limitNumber),
            withArgumentsInArray: nil) {
            while rs.next() {
                let question = Question()
                question.ID = Int(rs.intForColumn("questionId"))
                question.description =  rs.stringForColumn("description")
                question.image =  rs.stringForColumn("image")
                question.topic = selectTopic(Int(rs.intForColumn("topicId")))
                question.answers = selectAnswersByQuestionID(question.ID)

                questions.append(question)
            }
        }
        return questions
    }
    
    func selectQuestions(topicId: Int, limitNumber: Int) -> [Question] {
        var questions = [Question]()
        if let rs = database.executeQuery("select * from Questions where topicId = " + String(topicId)
            + " ORDER BY RANDOM() LIMIT " + String(limitNumber),
            withArgumentsInArray: nil) {
                while rs.next() {
                    let question = Question()
                    question.ID = Int(rs.intForColumn("questionId"))
                    question.description =  rs.stringForColumn("description")
                    question.image =  rs.stringForColumn("image")
                    question.topic = selectTopic(Int(rs.intForColumn("topicId")))
                    question.answers = selectAnswersByQuestionID(question.ID)
                    
                    questions.append(question)
                }
        }
        return questions
    }
    
    func selectQuestionByQuestionID(questionID: Int) -> Question? {
        let question = Question()
        if let rs = database.executeQuery("select * from Questions where questionID = " + String(questionID),
            withArgumentsInArray: nil) {
                var found = false
                while rs.next() {
                    found = true
                    question.ID = Int(rs.intForColumn("questionId"))
                    question.description =  rs.stringForColumn("description")
                    question.image =  rs.stringForColumn("image")
                    question.topic = selectTopic(Int(rs.intForColumn("topicId")))
                    question.answers = selectAnswersByQuestionID(question.ID)
                }
                if !found {
                    return nil
                }
        }
        return question
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
            if let rs = database.executeQuery("select * from Highscores where userID = " + String(userID) + " order by score desc,time asc", withArgumentsInArray: nil) {
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
    
    func selectErrorsWithQuestionsByUserID(userID: Int) -> [Error]{
        var errors = [Error]()
        if let user = selectUser(userID){
            if let rs = database.executeQuery("select * from Errors where userID = " + String(userID), withArgumentsInArray: nil) {
                while rs.next() {
                    let error = Error()
                    error.ID = Int(rs.intForColumn("errorID"))
                    error.user =  user
                    let questionID = Int(rs.intForColumn("questionID"))
                    error.question = selectQuestionByQuestionID(questionID)!
                    errors.append(error)
                }
            }
        }
        return errors
        
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
