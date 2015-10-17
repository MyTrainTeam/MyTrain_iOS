//
//  MenuTableViewCell.swift
//  MyTrain
//
//  Created by Clément Roulland on 17/10/2015.
//  Copyright © 2015 MyTrainTeam. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    static let height: CGFloat = 60
    static let reuseIdentifier = "MenuTableViewCell"

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!

    var item: String = "" {
        didSet {
            itemLabel.text = item
            switch(item){
            case "My Train" :
                itemImageView.image = UIImage(named: "MenuLogoImage")
            default:
                itemImageView.image = UIImage()
            }
        }
    }
}
