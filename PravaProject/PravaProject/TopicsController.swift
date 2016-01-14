//
//  TopicsController.swift
//  PravaProject
//
//  Created by MAC  on 1/10/16.
//  Copyright © 2016 FreeuniPravaTeam. All rights reserved.
//

import UIKit

class TopicsController: UITableViewController,NavigationControllerBackButtonDelegate {
    lazy var navigationBarTitle  = "Topics"
    lazy var backButtonTitle  = "Login"
    
    var topics : [Topic] = [Topic]()
    
    func viewControllerShouldPopOnBackButton() -> Bool {
        if( self.navigationController?.viewControllers.count == 1){
            return true
        }
        self.navigationController?.popViewControllerAnimated(true)
        return false
    }
    
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
    override func viewWillAppear(animated: Bool) {
        
        let navCon = (( UIApplication.sharedApplication().delegate) as! AppDelegate).navigationController
        navCon?.interactivePopGestureRecognizer?.enabled = true

        navCon?.navigationBar.topItem?.title = navigationBarTitle
        navCon?.navigationBar.backItem?.title = backButtonTitle
        navCon?.topViewController!.navigationItem.rightBarButtonItem = nil
        
    }

    // MARK: - Table view data source
    
    @IBAction func goBack(segue: UIStoryboardSegue) {
        
    }
    
    
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
        
        var str : String = ""
        
        for ch in text!.characters {
            if(ch == ")" ){
                break
            } else {
                str = str + String(ch)
            }
        }
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
                gamecontroller.backButtonName = self.navigationBarTitle
            }
        }
        
    }
    
    
}
