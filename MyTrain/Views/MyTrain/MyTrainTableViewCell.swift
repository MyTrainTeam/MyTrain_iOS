//
//  MyTrainTableViewCell.swift
//  MyTrain
//
//  Created by Clément Roulland on 17/10/2015.
//  Copyright © 2015 MyTrainTeam. All rights reserved.
//

import UIKit

class MyTrainTableViewCell: UITableViewCell {

    static let height: CGFloat = 52
    static let reuseIdentifier = "MyTrainTableViewCell"

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var dataTypeLabel: UILabel!

    var dataType: MyTrainData? {
        didSet {
            guard let _ = self.dataType else {
                return
            }

            switch(dataType!){
            case .ConnectedPeople :
                self.dataTypeLabel.text = "Personnes connectées"
                self.counterLabel.text = "79"
            case .ExchangedMessages :
                self.dataTypeLabel.text = "Messages echangés"
                self.counterLabel.text = "1991"
            case .OnBoardInformations :
                self.dataTypeLabel.text = "Informations à bord"
                self.counterLabel.text = "9"
            case .DestionationServices :
                self.dataTypeLabel.text = "Services à destination"
                self.counterLabel.text = "29"
            }
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
