//
//  CountriesTableViewController.swift
//  Countries
//
//  Created by Mohamed Eshawy on 10/16/18.
//  Copyright © 2018 SoleekLab. All rights reserved.
//

import UIKit
import FirebaseAuth
import Alamofire
import SwiftyJSON

class CountriesTableViewController: UITableViewController {
    var countriesList : [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80
        
        let url = URL(string: "http://country.io/names.json")
        Alamofire.request(url!, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.parseJson(json: json)
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    func parseJson(json : JSON) {
        for (key,subJson):(String, JSON) in json {
            let country = Country(name: subJson.stringValue, code: key)
            self.countriesList.append(country)
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return countriesList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CountryTableViewCell
        cell.cellData(country: countriesList[indexPath.row])
        
        return cell
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        dismiss(animated: true, completion: nil)
    }
}
