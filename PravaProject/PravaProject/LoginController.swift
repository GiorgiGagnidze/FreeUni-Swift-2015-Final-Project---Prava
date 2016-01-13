//
//  LoginController.swift
//  PravaProject
//
//  Created by MAC  on 1/12/16.
//  Copyright © 2016 FreeuniPravaTeam. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
        
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var password: UITextField!

    @IBAction func loginClick() {
        if let nameText = name.text, pasText = password.text{
            if nameText != "" && pasText != "" {
                if let user = DBHelper.getDBHelper().selectUser(nameText, password: pasText) {
                    let app = UIApplication.sharedApplication().delegate as! AppDelegate
                    app.user = user
                    performSegueWithIdentifier("login", sender: nil)
                } else {
                    self.presentViewController(LoginController.makeAlert("Login failed", message: "Check your name and password."),
                        animated: true, completion: nil)
                }
            } else {
                self.presentViewController(LoginController.makeAlert("Login failed", message: "Fill both fields."),
                    animated: true, completion: nil)
            }
        }
        
    }
    
    override func viewDidLoad() {
        (( UIApplication.sharedApplication().delegate) as! AppDelegate).navigationController  = self.navigationController
    }
    static func makeAlert(title: String, message: String) -> UIAlertController{
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        return alert
    }
    
}
