//
//  CustomTableViewCell.swift
//  WeatherTracker
//
//  Created by Ruchira Bandara on 5/6/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cityLable: UILabel!
    @IBOutlet weak var tempLable: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
