//
//  ViewController.swift
//  BMI Calculator
//
//  Created by mgarcia872 on 2/10/19.
//  Copyright © 2019 mgarcia872. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
    // Declaring the variables and constants
    // Declaring 2 arrays for the 2 pickers
    var weightPickerData : [String] = [String]()
    var heightPickerData : [String] = [String]()
    
    // Initializing and declaring data inside pickers
    let weightUnits = ["lbs","kg"]
    let heightUnits = ["in","m"]
    
    // Variables that store the text field user data
    var weightSelected : String = ""
    var heightSelected : String = ""
    
    // Variables that store the text field user data
    var weightEntered : Double = 0
    var heightEntered : Double = 0
    
    // IBOutlets
    
    @IBOutlet weak var weight: UITextField!
    
    @IBOutlet weak var weightUnit: UIPickerView!
    
    @IBOutlet weak var height: UITextField!
    
    @IBOutlet weak var heightUnit: UIPickerView!
    
    @IBOutlet weak var results: UILabel!
    
    @IBOutlet weak var BMIButton: UIButton!
    
    @IBOutlet weak var colorChange: UIButton!
    
    override func viewDidLoad()
    {
        // Adding data to arrays
        
        weightPickerData = ["lbs","kg"]
        heightPickerData = ["in","m"]
    
        
        self.heightUnit.delegate = self
        self.heightUnit.dataSource = self
        self.weightUnit.delegate = self
        self.weightUnit.dataSource = self
                super.viewDidLoad()
    
        // Do any additional setup after loading the view, typically from a nib.
        // Dispose of any resources that may be created
        
    }

    // The number of columns of data
    // The numberOfComponentsInPickerView method asks for the number of columns in your picker element. For example, if you wanted to do a picker for selecting time, you might have 3 components; one for each of hour, minutes and seconds.
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    // The number of rows of data
    // The numberOfRowsInComponent method asks for the number of rows of data in your UIPickerView element so we return the array count.
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if pickerView == weightUnit
        {
            return weightUnits.count
        }
        else
        {
            return heightUnits.count
        }
        
    }
    
    // The data to return for the row and component (column) that's being passed in
    // The pickerView:titleForRow:forComponent: method asks for the data for a specific row and specific component.
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if pickerView == weightUnit
        {
            weightSelected = weightPickerData[row]
            return weightSelected
        }
        else
        {
            heightSelected = heightPickerData[row]
            return heightSelected
        }
    }
    
    // Capture the picker view selection

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
    }
    
    // Push BMI Button Action
    @IBAction func calculateBMI(_ sender: UIButton)
    {
        // Get weight input
        var wInput = Double(weight.text!)!
        var hInput = Double(height.text!)!

        // If metric system
        if weightSelected == "kg" && heightSelected == "m"
        {
            // Calculating BMI
            let BMI = wInput/(hInput*hInput)
            
            // Displaying BMI in Results Label
            results.text = String(BMI)
            
            // Changing background color according to BMI Index
            if BMI < 25
            {
                self.colorChange.backgroundColor = .green
                self.colorChange.setTitleColor(.black, for: .normal)
                self.colorChange.setTitle("Healthy", for: .normal)
            }
                
            else if BMI > 25 && BMI < 30
            {
                self.colorChange.backgroundColor = .blue
                self.colorChange.setTitleColor(.black, for: .normal)
                self.colorChange.setTitle("Overweight", for: .normal)
            }
                
            else if BMI > 30 && BMI < 40
            {
                self.colorChange.backgroundColor = .orange
                self.colorChange.setTitleColor(.black, for: .normal)
                self.colorChange.setTitle("Obese", for: .normal)
            }
                
            else if BMI > 40 && BMI < 50
            {
                self.colorChange.backgroundColor = .red
                self.colorChange.setTitleColor(.black, for: .normal)
                self.colorChange.setTitle("Extreme Obesity", for: .normal)
            }
            
        }
        
        if weightSelected == "kg" && heightSelected == "in"
        {
            // Converting units and calculating BMI
            hInput /= 39.37
            let BMI = wInput/(hInput*hInput)
            
            // Displaying BMI in Results Label
            results.text = String(BMI)
            
            // Changing background color according to BMI Index
            if BMI < 25
            {
                self.colorChange.backgroundColor = .green
                self.colorChange.setTitleColor(.black, for: .normal)
                self.colorChange.setTitle("Healthy", for: .normal)
            }
                
            else if BMI > 25 && BMI < 30
            {
                self.colorChange.backgroundColor = .blue
                self.colorChange.setTitleColor(.black, for: .normal)
                self.colorChange.setTitle("Overweight", for: .normal)
            }
                
            else if BMI > 30 && BMI < 40
            {
                self.colorChange.backgroundColor = .orange
                self.colorChange.setTitleColor(.black, for: .normal)
                self.colorChange.setTitle("Obese", for: .normal)
            }
                
            else if BMI > 40 && BMI < 50
            {
                self.colorChange.backgroundColor = .red
                self.colorChange.setTitleColor(.black, for: .normal)
                self.colorChange.setTitle("Extreme Obesity", for: .normal)
            }
        }
        
        if weightSelected == "lbs" && heightSelected == "in"
        {
            // Converting units and calculating BMI
            wInput /= 2.205
            hInput /= 39.37
            let BMI = wInput/(hInput*hInput)
            
            // Displaying BMI in Results Label
            results.text = String(BMI)
            
            // Changing background color according to BMI Index
            if BMI < 25
            {
                self.colorChange.backgroundColor = .green
                self.colorChange.setTitleColor(.black, for: .normal)
                self.colorChange.setTitle("Healthy", for: .normal)
            }
                
            else if BMI > 25 && BMI < 30
            {
                self.colorChange.backgroundColor = .blue
                self.colorChange.setTitleColor(.black, for: .normal)
                self.colorChange.setTitle("Overweight", for: .normal)
            }
                
            else if BMI > 30 && BMI < 40
            {
                self.colorChange.backgroundColor = .orange
                self.colorChange.setTitleColor(.black, for: .normal)
                self.colorChange.setTitle("Obese", for: .normal)
            }
                
            else if BMI > 40 && BMI < 50
            {
                self.colorChange.backgroundColor = .red
                self.colorChange.setTitleColor(.black, for: .normal)
                self.colorChange.setTitle("Extreme Obesity", for: .normal)
            }
        }
        
        if weightSelected == "lbs" && heightSelected == "m"
        {
            // Converting units and calculating BMI
            wInput /= 2.205
            let BMI = wInput/(hInput*hInput)
            
            // Displaying BMI in Results Label
            results.text = String(BMI)
        
            // Changing background color according to BMI Index
            if BMI < 25
            {
                self.colorChange.backgroundColor = .green
                self.colorChange.setTitleColor(.black, for: .normal)
                self.colorChange.setTitle("Healthy", for: .normal)
            }
                
            else if BMI > 25 && BMI < 30
            {
                self.colorChange.backgroundColor = .blue
                self.colorChange.setTitleColor(.black, for: .normal)
                self.colorChange.setTitle("Overweight", for: .normal)
            }
                
            else if BMI > 30 && BMI < 40
            {
                self.colorChange.backgroundColor = .orange
                self.colorChange.setTitleColor(.black, for: .normal)
                self.colorChange.setTitle("Obese", for: .normal)
            }
                
            else if BMI > 40 && BMI < 50
            {
                self.colorChange.backgroundColor = .red
                self.colorChange.setTitleColor(.black, for: .normal)
                self.colorChange.setTitle("Extreme Obesity", for: .normal)
            }
        }
    }
  
}
