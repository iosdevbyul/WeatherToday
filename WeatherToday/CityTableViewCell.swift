//
//  CityTableViewCell.swift
//  WeatherToday
//
//  Created by COMATOKI on 2018-06-23.
//  Copyright © 2018 COMATOKI. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var celsius: UILabel!
    @IBOutlet weak var rainfallProbability: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
