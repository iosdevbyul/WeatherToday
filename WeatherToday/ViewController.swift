//
//  ViewController.swift
//  WeatherToday
//
//  Created by COMATOKI on 2018-06-23.
//  Copyright © 2018 COMATOKI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Properties
    // TableView
    @IBOutlet weak var tableViewforNationList: UITableView!
    // Identifier for cell
    let cellIdentifier: String = "nationCell"
    // Container for getting countries
    var country: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set a delegate and a datasource
        tableViewforNationList.delegate = self
        tableViewforNationList.dataSource = self
        
        // design navigationItem
        // set title
        self.navigationItem.title = "World Weather"
        
        // If necessary
//        self.navigationController?.navigationBar.backgroundColor = .blue
        
        // get counries
        getCounriesList()
        
        // reload the tableView
        tableViewforNationList.reloadData()
        
    }
    
    func getCounriesList() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        
        guard let dataAssest: NSDataAsset = NSDataAsset(name: "countries") else{
            return
        }
        
        do{
            self.country = try jsonDecoder.decode([Country].self, from: dataAssest.data)
        }catch{
            print(error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // TableView datasource and delegate methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell:NationTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? NationTableViewCell else {
            return UITableViewCell()
        }
        
        
        let counries: Country = country[indexPath.row]
                
        cell.nationNameLabel.text = counries.name
        cell.flagImage.image = UIImage(named: makeFlagImageName(code: counries.code))
        
        return cell
    }
    
    // make an image name for a flag
    func makeFlagImageName(code: String) -> String {
        let imageName: String = "flag_"+code
        return imageName
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // set number of rows based on number of nations
        return self.country.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Define cell's height
        return 60
    }
    
    // pass a data to nextViewController to set the navigation's title
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let selectedIndex = getSelectedIndex()
        
        if(selectedIndex > -1) {
        // Get datas safely
            let counries: Country = country[selectedIndex]
        
            if(segue.identifier == "gotoCity") {
                guard let nextViewController: CityViewController = segue.destination as? CityViewController else {
                    return
                }
                // Set nextViewController's title
                let titleString: String = counries.name
            
                // pass a nation code to nextViewController
                let nationCode: String = counries.code
            
                nextViewController.titleString = titleString
                nextViewController.nationCode = nationCode
            }
        }
    }
    
    func getSelectedIndex() -> Int {
        // Get a selected row's index safely
        guard let selectedRow: Int = tableViewforNationList.indexPathForSelectedRow?.row else {
            return -1
        }
        return selectedRow
    }

}

