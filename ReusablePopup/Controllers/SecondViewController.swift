//
//  SecondViewController.swift
//  ReusablePopup
//
//  Created by Abhishek Gupta on 14/03/20.
//  Copyright © 2020 Abhishek Gupta. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lblDate: UILabel!
    var observer: NSObjectProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*NotificationCenter.default.addObserver(forName: .saveDateTime, object: nil, queue: OperationQueue.main) { (notification) in
            let dateVC = notification.object as! DatePopupViewController
            self.lblDate.text = dateVC.formattedDate
        }*/
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Method 1.
        //NotificationCenter.default.addObserver(self, selector: #selector(handelPopUp), name: .saveDateTime, object: nil)
        
        // Method 2.
        NotificationCenter.default.addObserver(forName: .saveDateTime, object: nil, queue: OperationQueue.main) { (notification) in
            let dateVC = notification.object as! DatePopupViewController
            self.lblDate.text = dateVC.formattedDate
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }


}

