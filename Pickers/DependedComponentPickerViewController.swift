//
//  DependedComponentPickerViewController.swift
//  Pickers
//
//  Created by Artem Kovardin on 21/01/2018.
//  Copyright © 2018 Artem Kovardin. All rights reserved.
//

import UIKit

class DependedComponentPickerViewController: UIViewController,
UIPickerViewDataSource, UIPickerViewDelegate {
    
    private let stateComponent = 0
    private let zipComponent = 1
    private var stateZips:[String: [String]]!
    private var states:[String]!
    private var zips:[String]!
    
    @IBOutlet weak var dependedPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let bundle = Bundle.main
        let plistURL = bundle.url(forResource:"statedictionary", withExtension: "plist")
        
        stateZips = NSDictionary.init(contentsOf: (plistURL)!) as! [String: [String]]
        let allStates = stateZips.keys
        states = allStates.sorted()
        let selectedState = states[0]
        zips = stateZips[selectedState]
        
        print(selectedState)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        let stateRow = dependedPicker.selectedRow(inComponent: stateComponent)
        let zipRow = dependedPicker.selectedRow(inComponent: zipComponent)
        
        let state = states[stateRow]
        let zip = zips[zipRow]
        
        let title = "You selected zip code \(zip)"
        let message = "\(zip) is in \(state)"
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK:-
    // MARK: Picker Data Source Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == stateComponent {
            return states.count
        } else {
            return zips.count
        }
    }

    // MARК:-
    // MARK : Picker Delegate Methods
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == stateComponent {
            return states[row]
        } else {
            return zips[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == stateComponent {
            let selectedState = states[row]
            zips = stateZips[selectedState]
            dependedPicker.reloadComponent(zipComponent)
            dependedPicker.selectRow(0, inComponent: zipComponent, animated: true)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        let pickerWidth = pickerView.bounds.size.width
        if component == zipComponent {
            return pickerWidth/3
        } else {
            return 2 * pickerWidth/3
        }
    }
}
