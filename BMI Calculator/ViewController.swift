//
//  ViewController.swift
//  BMI Calculator
//
//  Created by student17 on 2/10/19.
//  Copyright © 2019 student17. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
    // Declaring the variables and constants
    
    var weightPickerData : [String] = [String]()
    
    var heightPickerData : [String] = [String]()
    
    let weightUnits = ["lbs","kg"]
    
    let heightUnits = ["in","m"]
    
    // IBOutlets
    
    @IBOutlet weak var weight: UITextField!
    
    @IBOutlet weak var weightUnit: UIPickerView!
    
    @IBOutlet weak var height: UITextField!
    
    @IBOutlet weak var heightUnit: UIPickerView!
    
    @IBOutlet weak var results: UILabel!
    
    
    override func viewDidLoad()
    {
        // Adding data to arrays
        
        weightPickerData = ["lbs","kg"]
        heightPickerData = ["in","m"]
        
        results.text = "HI!!!"
        
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
            return weightUnits[row]
        }
        else
        {
            return heightUnits[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
    }
    
    @IBAction func calculateBMI(_ sender: UIButton)
    {
        
        if weightUnits == ["kg"] && heightUnits == ["m"]
        {
            results.text = "HI!"
            //weight/(height)^2
        }
        
        //BMIResults.text! = "Metric"
    }
    
    /*@IBAction func buttonPressed(_ sender: Any)
    {
        
        if weightUnits == ["lbs"] && heightUnits == ["kg"]
        {
            
        }
        if weightUnits == ["kg"] && heightUnits == ["m"]
        {
            //BMIResults = "Metric"
            //weight/(height)^2
        }
    }*/
}

