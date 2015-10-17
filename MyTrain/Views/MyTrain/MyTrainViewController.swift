//
//  MyTrainViewController.swift
//  MyTrain
//
//  Created by Clément Roulland on 17/10/2015.
//  Copyright © 2015 MyTrainTeam. All rights reserved.
//

import UIKit

class MyTrainViewController: UIViewController {

    @IBOutlet weak var tableViewContainer: UIView!

    var myTrainTVC: MyTrainTableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.slidingViewController()?.topViewAnchoredGesture = [ECSlidingViewControllerAnchoredGesture.Panning, ECSlidingViewControllerAnchoredGesture.Tapping]
        self.slidingViewController()?.topViewController.view.addGestureRecognizer(self.slidingViewController().panGesture!)
    }

    @IBAction func quitTrainAction(sender: AnyObject) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.removeObjectForKey("trainNumber")
        userDefaults.removeObjectForKey("carNumber")
        userDefaults.synchronize()

        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("WelcomeMyTrainNavigationController")
        self.slidingViewController()?.topViewController = viewController
        self.slidingViewController()?.resetTopViewAnimated(true)
    }

    @IBAction func menuAction(sender: AnyObject) {
        self.slidingViewController()?.anchorTopViewToRightAnimated(true)
    }


    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "MyTrainTableViewController" {
            self.myTrainTVC = segue.destinationViewController as? MyTrainTableViewController
        }
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    
}
