//
//  WelcomeMyTrainViewController.swift
//  MyTrain
//
//  Created by Clément Roulland on 17/10/2015.
//  Copyright © 2015 MyTrainTeam. All rights reserved.
//

import UIKit

class WelcomeMyTrainViewController: UIViewController {

    @IBOutlet weak var tableViewContainer: UIView!
    var welcomeMyTrainTVC: WelcomeMyTrainTableViewController?

    override func viewDidLoad() {
        super.viewDidLoad()


        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)

    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        let topLineView = UIView(frame: CGRectMake(0, 0, self.tableViewContainer.frame.size.width, 0.5))
        topLineView.backgroundColor = self.welcomeMyTrainTVC?.tableViewColor
        self.tableViewContainer.addSubview(topLineView)

        let bottomLineView = UIView(frame: CGRectMake(0, tableViewContainer.frame.size.height, self.tableViewContainer.frame.size.width, 0.5))
        bottomLineView.backgroundColor = self.welcomeMyTrainTVC?.tableViewColor
        self.tableViewContainer.addSubview(bottomLineView)
    }

    //Calls this function when the tap is recognized.
    func dismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    @IBAction func menuAction(sender: AnyObject) {
        self.slidingViewController()?.anchorTopViewToRightAnimated(true)
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "WelcomeMyTrainTableViewController" {
            self.welcomeMyTrainTVC = segue.destinationViewController as? WelcomeMyTrainTableViewController
        }
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }

}
