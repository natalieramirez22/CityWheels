//
//  ViewController.swift
//  CityWheels
//
//  Created by natalieramirez22 on 4/10/21.
//

import UIKit
import MapKit

class HomeViewController: UIViewController {
    
    var distance = 5.4 //CHANGE
    
    @IBOutlet weak var carPriceLabel: UILabel!
    @IBOutlet weak var carTimeLabel: UILabel!
    var carPrice: Double = 0.0
    var carTime: Int = 0
    
    @IBOutlet weak var scooterPriceLabel: UILabel!
    @IBOutlet weak var scooterTimeLabel: UILabel!
    var scooterPrice: Double = 0.0
    var scooterTime: Int = 0
    
    @IBOutlet weak var bikePriceLabel: UILabel!
    @IBOutlet weak var bikeTimeLabel: UILabel!
    var bikePrice: Double = 0.0
    var bikeTime: Int = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        generateData()
        updateCounting()
        updateLabels()
    }

    func generateData() {
        var timer = Timer()
        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounting() {
        
        //car
        carTime = Int(distance * 2)
        carPrice = 2.2 + 1.29*distance
        if Int.random(in: 1...10) == 1 {
            carPrice += 3.5 //rush hour
        }
        
        //scooter
        scooterTime = Int(distance * 6)
        scooterPrice = 1 + 0.15 * Double(scooterTime)
        
        //bike
        bikeTime = Int(distance * 4)
        bikePrice = Double(2 + 2 * (bikeTime / 30))
        
        NSLog("running")
        updateLabels()
    }
    
    func updateLabels() {
        carPriceLabel.text = "$" + String(format: "%.2f", carPrice)
        carTimeLabel.text = String(carTime) + " min"
        
        scooterPriceLabel.text = "$" + String(format: "%.2f", scooterPrice)
        scooterTimeLabel.text = String(scooterTime) + " min"
        
        bikePriceLabel.text = "$" + String(format: "%.2f", bikePrice)
        bikeTimeLabel.text = String(bikeTime) + " min"
        
        //find lowest price
        if (carPrice < scooterPrice && carPrice < bikePrice) {
            carPriceLabel.textColor = UIColor(red: 89/256, green: 191/256, blue: 76/256, alpha: 1.0)
        }
        
        else if (scooterPrice < carPrice && scooterPrice < bikePrice) {
            scooterPriceLabel.textColor = UIColor(red: 89/256, green: 191/256, blue: 76/256, alpha: 1.0)
        }
        
        else {
            bikePriceLabel.textColor = UIColor(red: 89/256, green: 191/256, blue: 76/256, alpha: 1.0)
        }
        
        //find fastest time
        if (carTime < scooterTime && carTime < bikeTime) {
            carTimeLabel.textColor = UIColor(red: 89/256, green: 191/256, blue: 76/256, alpha: 1.0)
        }
        
        else if (scooterTime < carTime && scooterTime < bikeTime) {
            scooterTimeLabel.textColor = UIColor(red: 89/256, green: 191/256, blue: 76/256, alpha: 1.0)
        }
        
        else {
            bikeTimeLabel.textColor = UIColor(red: 89/256, green: 191/256, blue: 76/256, alpha: 1.0)
        }
    }

}

