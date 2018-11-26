//
//  Country.swift
//  WeatherToday
//
//  Created by COMATOKI on 2018-06-24.
//  Copyright © 2018 COMATOKI. All rights reserved.
//

import Foundation


struct Country: Codable {
    var name: String
    var code: String
    
    
    enum CodingKeys: String, CodingKey {
        case name = "korean_name"
        case code = "asset_name"
    }
}
