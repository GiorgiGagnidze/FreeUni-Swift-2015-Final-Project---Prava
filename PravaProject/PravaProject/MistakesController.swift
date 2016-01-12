//
//  MistakesController.swift
//  PravaProject
//
//  Created by MAC  on 1/10/16.
//  Copyright © 2016 FreeuniPravaTeam. All rights reserved.
//

import UIKit

class MistakesController: UITableViewController {
    
    var errors : [Error] = [Error]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        app.user = DBHelper.getDBHelper().selectUser(1)
        errors = DBHelper.getDBHelper().selectErrorsWithQuestionsByUserID(app.user!.ID)
        self.tableView.reloadData()
    }
    
    var curr = 1
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.errors.count
    }
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
        
    }
    
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        curr = errors[indexPath.row].ID
        
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("mistakeCell", forIndexPath: indexPath)
        
        let currScore = errors[indexPath.row]
        
        cell.textLabel?.text = currScore.question.description
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == nil { return }
        if(segue.identifier == "StartErrorSegue"){
            if let gamecontroller = segue.destinationViewController as? GameController {
                var q = [Question]()
                for(_,element) in errors.enumerate() {
                    q.append(element.question)
                }
                gamecontroller.questions = q
            }
        }
        
        if(segue.identifier == "QuestionSegue"){
            if let questioncontroller = segue.destinationViewController as? QuestionController {
                let q = errors[curr].question
                
                questioncontroller.question = q
                
                print(q.description + " yleeeee")
            }

        }
    }
}
