//
//  AddCityViewController.swift
//  WeatherTracker
//
//  Created by Ruchira Bandara on 5/9/22.
//

import UIKit

class AddCityViewController: UIViewController {

    
    @IBOutlet weak var btn: UIButton!
    
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func btn(_ sender: UIButton) {
        let City = textField.text ?? ""
        
        if City.isEmpty{
            let alert = UIAlertController(title: "No Any City", message: "Please enter city name before click the button", preferredStyle: .alert)
            
            let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alert.addAction(cancelButton)
            
            self.present(alert, animated: true, completion: nil)
        }else{
            let vc = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
            
            vc.AddCity = City
            
            
            self.show(vc, sender: nil)
        }
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
