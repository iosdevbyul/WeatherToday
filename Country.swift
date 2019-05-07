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
    
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decode(String.self, forKey: .code)
        
        var englishName = try values.decode(String.self, forKey: .name)
        
        if englishName == "한국" {
            englishName = "South Korea"
        }else if englishName == "독일" {
            englishName = "Germany"
        }else if englishName == "이탈리아" {
            englishName = "Italy"
        }else if englishName == "미국" {
            englishName = "United States"
        }else if englishName == "프랑스" {
            englishName = "France"
        }else {
            englishName = "Japan"
        }
        
        name = englishName
        
    }
}
