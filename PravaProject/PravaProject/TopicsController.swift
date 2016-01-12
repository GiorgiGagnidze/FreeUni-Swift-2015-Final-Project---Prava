//
//  TopicsController.swift
//  PravaProject
//
//  Created by MAC  on 1/10/16.
//  Copyright © 2016 FreeuniPravaTeam. All rights reserved.
//

import UIKit

class TopicsController: UITableViewController {
    
    var scores : [Topic] = [Topic]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        scores = DBHelper.getDBHelper().selectTopics()
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
        return self.scores.count
    }
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
        
    }
    
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        curr = scores[indexPath.row].ID
        
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("topicCell", forIndexPath: indexPath)
        
        let currScore = scores[indexPath.row]
        
        cell.textLabel?.text = currScore.topic
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == nil { return }
        if let gamecontroller = segue.destinationViewController as? GameController {
            gamecontroller.questions = DBHelper.getDBHelper().selectQuestions(curr, limitNumber: 10)
            print( gamecontroller.questions.count)
        }
        
    }
    
    
}
