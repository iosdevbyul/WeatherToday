//
//  City.swift
//  WeatherToday
//
//  Created by COMATOKI on 2018-06-24.
//  Copyright © 2018 COMATOKI. All rights reserved.
//

import Foundation

struct City: Codable {
    var name: String
    var state: Int
    var celsius: Double
    var rainfallProbability: Int
    
    enum CodingKeys: String, CodingKey {
        case state, celsius
        case name = "city_name"
        case rainfallProbability = "rainfall_probability"
    }
    
}









