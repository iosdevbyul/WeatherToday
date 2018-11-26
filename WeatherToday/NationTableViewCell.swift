//
//  NationTableViewCell.swift
//  WeatherToday
//
//  Created by COMATOKI on 2018-06-23.
//  Copyright © 2018 COMATOKI. All rights reserved.
//

import UIKit

class NationTableViewCell: UITableViewCell {

    //Properties
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var nationNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //go to city table view 
    }

}
