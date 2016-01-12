//
//  RegisterController.swift
//  PravaProject
//
//  Created by MAC  on 1/12/16.
//  Copyright © 2016 FreeuniPravaTeam. All rights reserved.
//

import UIKit

class RegisterController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var rePassword: UITextField!
    
    @IBAction func registerClick(sender: UIButton) {
        if let nameText = name.text, pasText = password.text, rePasText = rePassword.text{
            if nameText != "" && pasText != "" && rePasText != "" {
                if pasText == rePasText {
                    let newUser = User()
                    newUser.name = nameText
                    newUser.password = pasText
                    if let _ = DBHelper.getDBHelper().insertUser(newUser) {
                        self.presentViewController(LoginController.makeAlert("Registration successful", message: "Go back and login."),
                            animated: true, completion: nil)
                    } else {
                        self.presentViewController(LoginController.makeAlert("Register failed", message: "This name is already used."),
                            animated: true, completion: nil)
                    }
                } else {
                    self.presentViewController(LoginController.makeAlert("Register failed", message: "Retype password correctly."),
                        animated: true, completion: nil)
                }
                
            } else {
                self.presentViewController(LoginController.makeAlert("Register failed", message: "Fill all fields."),
                    animated: true, completion: nil)
            }
        }
    }
    
}
