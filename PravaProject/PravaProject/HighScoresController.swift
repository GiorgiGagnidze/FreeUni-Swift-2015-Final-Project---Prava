//
//  HighScoresController.swift
//  PravaProject
//
//  Created by MAC  on 1/10/16.
//  Copyright © 2016 FreeuniPravaTeam. All rights reserved.
//

import UIKit

class HighScoresController: UITableViewController {
    
    var scores : [HighScore] = [HighScore]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        scores = DBHelper.getDBHelper().selectTopNumberHighScores(10)
        self.tableView.reloadData()
    }
    
    
    
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
        
        return 109
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("scoreCell", forIndexPath: indexPath) as! ScoreCell
        
        let currScore = scores[indexPath.row]
        
        cell.nameLabel.text = currScore.user.name
        cell.scoreLabel.text = String(currScore.score)
        cell.timeLabel.text = String(currScore.time)
        
        return cell
    }
    
}
