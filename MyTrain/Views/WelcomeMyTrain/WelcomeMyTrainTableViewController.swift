//
//  WelcomeMyTrainTableViewController.swift
//  MyTrain
//
//  Created by Clément Roulland on 17/10/2015.
//  Copyright © 2015 MyTrainTeam. All rights reserved.
//

import UIKit

class WelcomeMyTrainTableViewController: UITableViewController {

    let tableViewColor = UIColor(rgba: "#777777")

    @IBOutlet weak var trainNumberLabel: UILabel!
    @IBOutlet weak var carNumberLabel: UILabel!
    @IBOutlet weak var trainNumberTextField: UITextField!
    @IBOutlet weak var carNumberTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.carNumberLabel.textColor = tableViewColor
        self.trainNumberLabel.textColor = tableViewColor

        self.tableView.separatorColor = tableViewColor
    }

    override func tableView(_tableView: UITableView,
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
