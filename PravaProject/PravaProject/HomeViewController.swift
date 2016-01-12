//
//  HomeViewController.swift
//  PravaProject
//
//  Created by Koko Tagauri on 1/11/16.
//  Copyright © 2016 FreeuniPravaTeam. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var dbhelper : DBHelper = DBHelper.getDBHelper()
    
    @IBAction func buttonClicked(sender: UIButton) {
        //self.performSegueWithIdentifier("GameSegue", sender: self)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == nil { return }
        
        if let gamecontroller = segue.destinationViewController as? GameController {
            gamecontroller.enteredFromGame = true
            gamecontroller.questions = dbhelper.selectQuestions(10)
        }
    }
    
    @IBAction func goBack(segue: UIStoryboardSegue) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
