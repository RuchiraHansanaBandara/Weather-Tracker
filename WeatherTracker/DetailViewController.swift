//
//  DetailViewController.swift
//  WeatherTracker
//
//  Created by Ruchira Bandara on 5/10/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var CityName: UILabel!
    @IBOutlet weak var tempLable: UILabel!
    @IBOutlet weak var tempMaxLable: UILabel!
    @IBOutlet weak var tempMinLable: UILabel!
    @IBOutlet weak var humidityLable: UILabel!
    
    var cityName = ""
    var temperature = ""
    var tempMax = ""
    var tempMin = ""
    var humidity = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        CityName.text = cityName
        tempLable.text = temperature
        tempMaxLable.text = tempMax
        tempMinLable.text = tempMin
        humidityLable.text = humidity
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
