//
//  HomeViewController.swift
//  PravaProject
//
//  Created by Koko Tagauri on 1/11/16.
//  Copyright © 2016 FreeuniPravaTeam. All rights reserved.
//

import UIKit

protocol NavigationControllerBackButtonDelegate {
    func viewControllerShouldPopOnBackButton() -> Bool
}
extension UINavigationController {
    
    func navigationBar(navigationBar: UINavigationBar, shouldPopItem item: UINavigationItem) -> Bool {
        
        // Prevents from a synchronization issue of popping too many navigation items
        // and not enough view controllers or viceversa from unusual tapping
        if self.viewControllers.count < navigationBar.items?.count {
            return true
        }
        
        // Check if we have a view controller that wants to respond to being popped
        var shouldPop = true
        if let viewController = self.topViewController as? NavigationControllerBackButtonDelegate {
            shouldPop = viewController.viewControllerShouldPopOnBackButton()
        }
        if let viewController = self.topViewController as? UITabBarController {
            let navCon = (viewController.selectedViewController as? UINavigationController)
            
            if let viewController2 = navCon!.viewControllers[0] as? NavigationControllerBackButtonDelegate {
                shouldPop = viewController2.viewControllerShouldPopOnBackButton()
            }
            
        }
        if (shouldPop) {
            dispatch_async(dispatch_get_main_queue()) {
                self.popViewControllerAnimated(true)
            }
        }
        else {
            // Prevent the back button from staying in an disabled state
            for view in navigationBar.subviews {
                if view.alpha < 1.0 {
                    [UIView.animateWithDuration(0.25, animations: { () -> Void in
                        view.alpha = 1.0
                    })]
                }
            }
            
        }
        
        return false
    }
}

class HomeViewController: UIViewController,NavigationControllerBackButtonDelegate {
    lazy var navigationBarTitle  = "Home"
    lazy var backButtonTitle  = "Login"
    var dbhelper : DBHelper = DBHelper.getDBHelper()
    func viewControllerShouldPopOnBackButton() -> Bool {
        if( self.navigationController?.viewControllers.count == 1){
            return true
        }
        self.navigationController?.popViewControllerAnimated(true)
        return false
    }
    @IBAction func buttonClicked(sender: UIButton) {
        //self.performSegueWithIdentifier("GameSegue", sender: self)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
   
        let navCon = (( UIApplication.sharedApplication().delegate) as! AppDelegate).navigationController
        navCon?.interactivePopGestureRecognizer?.enabled = true

        navCon?.navigationBar.topItem?.title = navigationBarTitle
        navCon?.navigationBar.backItem?.title = backButtonTitle
        navCon?.topViewController!.navigationItem.rightBarButtonItem = nil
        navCon?.navigationItem.rightBarButtonItem?.enabled = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == nil { return }
        
        if let gamecontroller = segue.destinationViewController as? GameController {
            gamecontroller.enteredFromGame = true
            gamecontroller.backButtonName = self.navigationBarTitle
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
