//
//  MenuViewController.swift
//  MyTrain
//
//  Created by Clément Roulland on 17/10/2015.
//  Copyright © 2015 MyTrainTeam. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    let menuItems = ["My Train"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.slidingViewController()?.topViewAnchoredGesture = [ECSlidingViewControllerAnchoredGesture.Panning, ECSlidingViewControllerAnchoredGesture.Tapping]
        self.slidingViewController()?.topViewController.view.addGestureRecognizer(self.slidingViewController().panGesture!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - UITableViewDataSource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuItems.count
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return MenuTableViewCell.height
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(MenuTableViewCell.reuseIdentifier, forIndexPath: indexPath) as! MenuTableViewCell

        cell.item = self.menuItems[indexPath.row]

        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch(menuItems[indexPath.row]){
        case "My Train" :
            let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("MyTrainNavigationController")
            self.slidingViewController()?.topViewController = viewController!
            self.slidingViewController()?.resetTopViewAnimated(true)
        default:
            SVProgressHUD.showErrorWithStatus("Peinture fraiche !")
            break
        }

        self.slidingViewController()?.topViewAnchoredGesture = [ECSlidingViewControllerAnchoredGesture.Panning, ECSlidingViewControllerAnchoredGesture.Tapping]
        self.slidingViewController()?.topViewController.view.addGestureRecognizer(self.slidingViewController().panGesture!)

        self.slidingViewController()?.resetTopViewAnimated(true)

        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
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
