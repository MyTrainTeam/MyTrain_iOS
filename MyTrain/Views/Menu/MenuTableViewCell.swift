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
            switch(item){
            case "My Train" :
                itemImageView.image = UIImage(named: "MenuMyTrainIcon")
                itemLabel.text = "My Train"
            case "Messages" :
                itemImageView.image = UIImage(named: "MenuMessagesIcon")
                itemLabel.text = "Messages"
            case "Friends" :
                itemImageView.image = UIImage(named: "MenuFriendsIcon")
                itemLabel.text = "Contacts"
            case "Profile" :
                itemImageView.image = UIImage(named: "MenuProfileIcon")
                itemLabel.text = "Profil"
            case "Settings" :
                itemImageView.image = UIImage(named: "MenuSettingsIcon")
                itemLabel.text = "Paramètres"
            default:
                itemImageView.image = UIImage()
            }
        }
    }
}
