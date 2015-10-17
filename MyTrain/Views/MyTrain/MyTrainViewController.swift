//
//  MyTrainViewController.swift
//  MyTrain
//
//  Created by Clément Roulland on 17/10/2015.
//  Copyright © 2015 MyTrainTeam. All rights reserved.
//

import UIKit

enum MyTrainData {
    case ConnectedPeople
    case ExchangedMessages
    case OnBoardInformations
    case DestionationServices
}

class MyTrainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var trainAndCarLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    let dataRows: [MyTrainData] = [.ConnectedPeople, .ExchangedMessages, .OnBoardInformations, .DestionationServices]
    let tableViewColor = UIColor(rgba: "#777777")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.slidingViewController()?.topViewAnchoredGesture = [ECSlidingViewControllerAnchoredGesture.Panning, ECSlidingViewControllerAnchoredGesture.Tapping]
        self.slidingViewController()?.topViewController.view.addGestureRecognizer(self.slidingViewController().panGesture!)

        self.printTrainLabel()

        self.tableView.separatorColor = tableViewColor
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        let topLineView = UIView(frame: CGRectMake(0, 0, self.tableView.frame.size.width, 0.5))
        topLineView.backgroundColor = self.tableViewColor
        self.tableView.addSubview(topLineView)

        let bottomLineView = UIView(frame: CGRectMake(0, tableView.frame.size.height, self.tableView.frame.size.width, 0.5))
        bottomLineView.backgroundColor = self.tableViewColor
        self.tableView.addSubview(bottomLineView)
    }

    private func printTrainLabel() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let trainNumber = userDefaults.valueForKey("trainNumber") as? String,
            let carNumber = userDefaults.valueForKey("carNumber") as? String
        {
            let nbAttributes = [ NSForegroundColorAttributeName : UIColor(rgba:"#2196F3"), NSFontAttributeName : UIFont.systemFontOfSize(17.0, weight: UIFontWeightMedium) ]
            let txtAttributes = [NSFontAttributeName : UIFont.systemFontOfSize(17.0, weight: UIFontWeightMedium)]
            let attString = NSMutableAttributedString(string:"", attributes:txtAttributes)
            attString.appendAttributedString(NSMutableAttributedString(string:"Train ", attributes:txtAttributes))
            attString.appendAttributedString(NSMutableAttributedString(string:trainNumber, attributes:nbAttributes))
            attString.appendAttributedString(NSMutableAttributedString(string:", voiture ", attributes:txtAttributes))
            attString.appendAttributedString(NSMutableAttributedString(string:carNumber, attributes:nbAttributes))
            attString.appendAttributedString(NSMutableAttributedString(string:".", attributes:txtAttributes))
            self.trainAndCarLabel.attributedText = attString
        }
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

    // MARK: - UITableViewDataSource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataRows.count
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return MyTrainTableViewCell.height
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(MyTrainTableViewCell.reuseIdentifier, forIndexPath: indexPath) as! MyTrainTableViewCell

        cell.dataType = self.dataRows[indexPath.row]

        return cell
    }

    func tableView(_tableView: UITableView,
        willDisplayCell cell: UITableViewCell,
        forRowAtIndexPath indexPath: NSIndexPath) {

            if cell.respondsToSelector("setSeparatorInset:") {
                cell.separatorInset = UIEdgeInsetsZero
            }
            if cell.respondsToSelector("setLayoutMargins:") {
                cell.layoutMargins = UIEdgeInsetsZero
            }
            if cell.respondsToSelector("setPreservesSuperviewLayoutMargins:") {
                cell.preservesSuperviewLayoutMargins = false
            }
    }

    // MARK: - UITableViewDelegate

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch(self.dataRows[indexPath.row]){
        default:
            SVProgressHUD.showErrorWithStatus("Peinture fraiche !")
            break
        }

        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }


    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    
}
