//
//  TopicsController.swift
//  PravaProject
//
//  Created by MAC  on 1/10/16.
//  Copyright © 2016 FreeuniPravaTeam. All rights reserved.
//

import UIKit

class TopicsController: UITableViewController {
    
    var topics : [Topic] = [Topic]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        topics = DBHelper.getDBHelper().selectTopics()
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
        return self.topics.count
    }
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
        
    }
    
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        let text = cell!.textLabel?.text
        
        //print("textia:   " + text!)
        
        var str : String = ""
        
        for ch in text!.characters {
            if(ch == ")" ){
                print("rfrfrfrfrfrfrf")
                break
            } else {
                str = str + String(ch)
            }
        }
        
        print(str)
        
        curr = Int(str)! - 1
        
        performSegueWithIdentifier("TopicsSegue", sender: cell)
        
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("topicCell", forIndexPath: indexPath)
        
        let currScore = topics[indexPath.row]
        
        cell.textLabel?.text = String((indexPath.row+1)) + ")  " + currScore.topic
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == nil { return }
        if(segue.identifier == "TopicsSegue") {
            if let gamecontroller = segue.destinationViewController as? GameController {
                gamecontroller.questions = DBHelper.getDBHelper().selectQuestions(topics[curr].ID, limitNumber: 10)
                print( gamecontroller.questions.count)
            }
        }
        
    }
    
    
}
