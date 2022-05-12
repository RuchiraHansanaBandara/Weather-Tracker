//
//  ViewController.swift
//  WeatherTracker
//
//  Created by Ruchira Bandara on 5/6/22.
//

import UIKit


var cityArray: [String] = []

var tempArray: [String] = []

var tempMaxArray:[String] = []

var HumidityArray:[String] = []

var tempMinArray:[String] = []



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
  
    
    
    
    var AddCity = String()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("This temp min Array oyeeeeeeeeee\(tempMinArray)")
        if !AddCity.isEmpty{
            cityArray.append(AddCity)
        }
        
        
        
        
        getTodayResult(cityName: AddCity){ temper in
            let temp = temper
            print("hureeeeeeeeeeeeeeeeee temp is \(temp)")
            tempArray.append(temp)
            print("this is return temp array \(tempArray)")
            
            let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
            self.tableView.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
            
            self.tableView.delegate = self
            self.tableView.dataSource = self
            
        }
        
        
        
        
    }
    
    func tableView(_ tableview: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let VC = storyboard?.instantiateViewController(identifier: "DetailViewController") as?
            DetailViewController{
            VC.cityName = cityArray[indexPath.row]
            VC.temperature = tempArray[indexPath.row]
            VC.tempMax = tempMaxArray[indexPath.row]
            VC.tempMin = tempMinArray[indexPath.row]
            VC.humidity = HumidityArray[indexPath.row]
            
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.cityLable.text = cityArray[indexPath.row]
        
        cell.tempLable.text = tempArray[indexPath.row]
        return cell
    }
    
    
    
    
    func getTodayResult(cityName: String, Completion: @escaping (String) -> Void) {
        if let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&units=metric&appid=4efd88605b7dea12565375f4c3d29318") {
            let request = URLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request){(data, response, error) in
                if error == nil {
                    if let incomingData = data {
                        do {
                            let json = try JSONSerialization.jsonObject(with: incomingData, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                            //print (json)
                            
                            if let main = json["main"] as? NSDictionary {
                                let temp = main["temp"]
                                let temper = String("\(temp as! Double) °C")
                                
                                let tempMin = main["temp_min"]
                                let temperMin = String("\(tempMin as! Double) °C")
                                
                                let tempMax = main["temp_max"]
                                let temperMax = String("\(tempMax as! Double) °C")
                                
                                let Humid = main["humidity"]
                                let Humidity = String("\(Humid as! Double)")
                                
                                tempMinArray.append(temperMin)
                                tempMaxArray.append(temperMax)
                                HumidityArray.append(Humidity)
                                
                                print("This is temp min Array === \(tempMinArray )")
                                print ("\(cityName) temp is = \(temper)")
                                
                                Completion(temper)
                                
                                
                                
                            }
                            
                        } catch {
                            print("Hee heee")
                        }
                    }
                }
            }
            task.resume()
        }
        
        
    }
    
}


