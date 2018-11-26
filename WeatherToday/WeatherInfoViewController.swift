//
//  WeatherInfoViewController.swift
//  WeatherToday
//
//  Created by COMATOKI on 2018-06-24.
//  Copyright © 2018 COMATOKI. All rights reserved.
//

import UIKit

class WeatherInfoViewController: UIViewController {

    //Properties
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var rainfallProbabilityLabel: UILabel!

    var selectedCity:City?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if selectedCity != nil {
            setDates()
        }
    }
    
    func setDates(){
        // Set the title
        self.navigationItem.title = selectedCity?.name
        
        // Set temperature
        guard let temperature = selectedCity?.celsius else {
            return
        }
        let fahrenheit = Double(round((temperature / 5 * 9 + 32)*10)/10)
        temperatureLabel.text = "Temperature \(temperature)degree / Fahrenheit \(fahrenheit)degree"
        
        // Set rainfall probability
        guard let rainfallProbabilityText = selectedCity?.rainfallProbability else {
            return
        }
        rainfallProbabilityLabel.text = "Rainfall Probability \(rainfallProbabilityText)%"
        
        // Set an image
        var imageName: String?
        var weatherState: String?
        switch selectedCity?.state {
        case 10:
            imageName = "sunny"
            weatherState = "Sunny"
        case 11:
            imageName = "cloudy"
            weatherState = "Cloudy"
        case 12:
            imageName = "rainy"
            weatherState = "Rainy"
        case 13:
            imageName = "snowy"
            weatherState = "Snowy"
        default:
            imageName = ""
            weatherState = ""
        }
        weatherImage.image = UIImage(named: imageName!)
        weatherLabel.text = weatherState
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 

}
