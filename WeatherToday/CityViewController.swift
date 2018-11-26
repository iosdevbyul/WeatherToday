//
//  CityViewController.swift
//  WeatherToday
//
//  Created by COMATOKI on 2018-06-23.
//  Copyright © 2018 COMATOKI. All rights reserved.
//

import UIKit

class CityViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // Set properties
    @IBOutlet weak var cityTableView: UITableView!
    
    // To get datas from a previous viewController
    var titleString: String?
    var nationCode: String?
    
    var cities: [City] = []
    
    let cellIdentifier: String = "CityCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityTableView.delegate = self
        cityTableView.dataSource = self
        
        // Set the title
        // also it's available to use self.title = "smt"
        self.navigationItem.title = titleString
        
        // Get cities list from the DataAsset
        getDataFromCity()
    }
    
    func getDataFromCity() {
        let jsonDecoder:JSONDecoder = JSONDecoder()
        
        guard let nationCodeContainer: String = nationCode else {
            return
        }
        
        guard let dataAsset:NSDataAsset = NSDataAsset(name: nationCodeContainer) else {
            return
        }
        
        do{
            cities = try jsonDecoder.decode([City].self, from: dataAsset.data)
        }catch{
            print(error.localizedDescription)
        }
    }

    //TableView datasource and delegate methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: CityTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CityTableViewCell else {
            return UITableViewCell()
        }
        
        // Contains city's information to set datas to labels on the viewController
        let selectedCity:City = cities[indexPath.row]
        
        // Set the name of city selected by a user
        cell.cityName.text = selectedCity.name

        // Set temperature
        let temperatureText = selectedCity.celsius
        let fahrenheit = Double(round((selectedCity.celsius / 5 * 9 + 32)*10)/10)
        cell.celsius.text = "Temperature \(temperatureText)degree / Fahrenheit \(fahrenheit) degree"
        
        // Set rainfall probability
        let rainfallProbabilityText = selectedCity.rainfallProbability
        cell.rainfallProbability.text = "Rainfall Probability \(rainfallProbabilityText)%"
        
        /*
         10 sunny
         11 cloudy
         12 rainy
         13 snowy
         */
        
        var imageName: String?
        switch selectedCity.state {
        case 10:
            imageName = "sunny"
        case 11:
            imageName = "cloudy"
        case 12:
            imageName = "rainy"
        case 13:
            imageName = "snowy"
        default:
            imageName = ""
        }
        cell.weatherImage.image = UIImage(named: imageName!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Set number of rows based on number of nations
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Define a height of tableView
        return 178
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let selectedIndex = getSelectedIndex()
        
        if(selectedIndex > -1) {
        
            let selectedCity: City = self.cities[selectedIndex]
        
            if(segue.identifier == "gotoWeatherInfo") {
                let nextViewController: WeatherInfoViewController = segue.destination as! WeatherInfoViewController
            
                // Delivers information of a selected city
                nextViewController.selectedCity = selectedCity
                
            }
        }
    }
    
    func getSelectedIndex() -> Int {
        // Get a selected row's index safely
        guard let selectedRow: Int = cityTableView.indexPathForSelectedRow?.row else {
            return -1
        }
        return selectedRow
    }

}





