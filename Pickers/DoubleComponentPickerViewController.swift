//
//  DouЬleComponentPickerViewController.swift
//  Pickers
//
//  Created by Artem Kovardin on 21/01/2018.
//  Copyright © 2018 Artem Kovardin. All rights reserved.
//

import UIKit

class DoubleComponentPickerViewController: UIViewController,
    UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var doublePicker: UIPickerView!
    
    private let fillingComponent = 0
    private let breadComponent = 1
    private let fillingTypes = [
        "Ham", "Turkey", "Peanut Butter", "Tuna Salad",
        "Chicken Salad", "Roast Beef", "Vegemite"
    ]
    private let breadTypes = [
        "White", "Whole Wheat", "Rye", "Sourdough", "Seven Grain"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        let fillingRow = doublePicker.selectedRow(inComponent: fillingComponent)
        let breadRow = doublePicker.selectedRow(inComponent: breadComponent)
        
        let filling = fillingTypes[fillingRow]
        let bread = breadTypes[breadRow]
        let message = "Your \(filling) on \(bread) bread will be right up"
        
        let alert = UIAlertController(
            title: "Thank your for your order",
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "Great",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: -
    // MARK: Picker Data Source Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == breadComponent {
            return breadTypes.count
        } else {
            return fillingTypes.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == breadComponent {
            return breadTypes[row]
        } else {
            return fillingTypes[row]
        }
    }
}
