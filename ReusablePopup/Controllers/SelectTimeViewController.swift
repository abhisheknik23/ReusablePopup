//
//  SelectTimeViewController.swift
//  ReusablePopup
//
//  Created by Abhishek Gupta on 14/03/20.
//  Copyright © 2020 Abhishek Gupta. All rights reserved.
//

import UIKit

class SelectTimeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func selectTimeAction(_ sender: UIButton) {
        let sb = UIStoryboard(name: "DatePopupViewController", bundle: nil)
        let popup = sb.instantiateInitialViewController() as! DatePopupViewController
        popup.showTimePicker = true
        self.present(popup, animated: true)
    }
    

}
