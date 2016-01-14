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
    
    override func viewDidAppear(animated: Bool) {
        
        scores = DBHelper.getDBHelper().selectTopNumberHighScores(10)
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func viewWillAppear(animated: Bool) {
        
        let navCon = (( UIApplication.sharedApplication().delegate) as! AppDelegate).navigationController
        navCon?.interactivePopGestureRecognizer?.enabled = true
        navCon?.navigationBar.topItem?.title = "High scores"
        navCon?.navigationBar.backItem?.title = "Login"
        navCon?.topViewController!.navigationItem.rightBarButtonItem = nil
        
    }
    
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
        
        let (h,m,s) = secondsToHoursMinutesSeconds(currScore.time)
        
        let hours = addZeroBefore(String(h))
        let minutes = addZeroBefore(String(m))
        let seconds = addZeroBefore(String(s))
        cell.timeLabel.text = String(hours+":"+minutes+":"+seconds)
        
        return cell
    }
    
    private func addZeroBefore (var time : String) -> String {
        if (time.characters.count == 1){
            time = "0"+time
        }
        return time
    }
    
    private func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
}
