//
//  DatePopupViewController.swift
//  ReusablePopup
//
//  Created by Abhishek Gupta on 14/03/20.
//  Copyright © 2020 Abhishek Gupta. All rights reserved.
//

import UIKit

class DatePopupViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dataPicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    //Create Function type
    var onSave: ((_ data: String) -> ())?
    var showTimePicker: Bool = false
    
    var formattedDate: String {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: dataPicker.date)
    }
    
    var formattedTime: String {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: dataPicker.date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if showTimePicker {
            titleLabel.text = "Select Time"
            dataPicker.datePickerMode = .time
            saveButton.setTitle("Save Time", for: .normal)
        }
    }
    
    @IBAction func saveDataAction(_ sender: UIButton) {
        NotificationCenter.default.post(name: .saveDateTime, object: self)
        
        if showTimePicker {
            onSave?(formattedTime)
        }else {
            onSave?(formattedDate)
        }
        print("printing after post that means notification works synchronously")
        dismiss(animated: true)
    }
    
}
