//
//  MistakesController.swift
//  PravaProject
//
//  Created by MAC  on 1/10/16.
//  Copyright © 2016 FreeuniPravaTeam. All rights reserved.
//

import UIKit

class MistakesController: UITableViewController,NavigationControllerBackButtonDelegate {
    lazy var navigationBarTitle  = "Mistakes"
    lazy var backButtonTitle  = "Login"

    var errors : [Error] = [Error]()
    func viewControllerShouldPopOnBackButton() -> Bool {
        if( self.navigationController?.viewControllers.count == 1){
            return true
        }
        self.navigationController?.popViewControllerAnimated(true)
        return false
    }
    
    func nextbuttonAction(){
        if (errors.count > 0) {
            performSegueWithIdentifier("StartErrorSegue", sender: self)
        } else {
            self.presentViewController(LoginController.makeAlert("Warning!", message: "There ar no mistakes to make test with them."),
                animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        errors = DBHelper.getDBHelper().selectErrorsWithQuestionsByUserID(app.user!.ID)
        
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        let navCon = (( UIApplication.sharedApplication().delegate) as! AppDelegate).navigationController
        navCon?.interactivePopGestureRecognizer?.enabled = true

        navCon?.navigationBar.topItem?.title = navigationBarTitle
        navCon?.navigationBar.backItem?.title = backButtonTitle
        let next =  UIBarButtonItem(title: "Start", style: .Plain, target: self, action: "nextbuttonAction")
        navCon?.topViewController!.navigationItem.rightBarButtonItem = next
        navCon?.navigationItem.rightBarButtonItem?.enabled = true

        
    }

    
    override func viewDidAppear(animated: Bool) {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        
        errors = DBHelper.getDBHelper().selectErrorsWithQuestionsByUserID(app.user!.ID)
        self.tableView.reloadData()

    }
    
    @IBAction func goBack(segue: UIStoryboardSegue) {
        
    }
    
    var curr = 0
    
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
        
        performSegueWithIdentifier("QuestionSegue", sender: cell)
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("mistakeCell", forIndexPath: indexPath)
        
        let currScore = errors[indexPath.row]
        
        cell.textLabel?.text = String((indexPath.row+1)) + ")  " + currScore.question.description
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
                gamecontroller.backButtonName = navigationBarTitle
            }
        }
        
        if(segue.identifier == "QuestionSegue"){
            if let questioncontroller = segue.destinationViewController as? QuestionController {
                
                let q = errors[curr].question
                questioncontroller.question = q
                
            }

        }
    }
}
