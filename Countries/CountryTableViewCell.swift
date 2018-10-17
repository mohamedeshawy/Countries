//
//  CountryTableViewCell.swift
//  Countries
//
//  Created by Mohamed Eshawy on 10/16/18.
//  Copyright © 2018 SoleekLab. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    
    func cellData(country : Country) {
        self.nameLabel.text = country.name
        self.codeLabel.text = country.code
    }
}
