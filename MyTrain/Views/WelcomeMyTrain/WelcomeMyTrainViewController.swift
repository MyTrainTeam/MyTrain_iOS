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
    @IBOutlet weak var compostTicketButton: UIButton!
    var welcomeMyTrainTVC: WelcomeMyTrainTableViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.slidingViewController()?.topViewAnchoredGesture = [ECSlidingViewControllerAnchoredGesture.Panning, ECSlidingViewControllerAnchoredGesture.Tapping]
        self.slidingViewController()?.topViewController.view.addGestureRecognizer(self.slidingViewController().panGesture!)

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)

        self.compostTicketButton.layer.cornerRadius = 4
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

    @IBAction func compostTicketAction(sender: AnyObject) {
        guard let trainNumber = self.welcomeMyTrainTVC?.trainNumberTextField.text,
            let carNumber = self.welcomeMyTrainTVC?.carNumberTextField.text
            where !trainNumber.isEqual("") && !carNumber.isEqual("") else {
                SVProgressHUD.showErrorWithStatus("N° train et N° voiture\n doivent être renseignés")
                return
        }

        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setValue(trainNumber, forKey: "trainNumber")
        userDefaults.setValue(carNumber, forKey: "carNumber")
        userDefaults.synchronize()

        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("MyTrainNavigationController")
        self.slidingViewController()?.topViewController = viewController
        self.slidingViewController()?.resetTopViewAnimated(true)
    }


    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "WelcomeMyTrainTableViewController" {
            self.welcomeMyTrainTVC = segue.destinationViewController as? WelcomeMyTrainTableViewController
        }

    }

}
