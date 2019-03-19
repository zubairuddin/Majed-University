//
//  AdvisorViewController.swift
//  studentModule
//
//  Created by mac on 31/01/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import Firebase

class AdvisorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //When We Click on HOME button this method will be called
    @IBAction func homebackButton(_ sender: Any) {
        
        //This is used to back to that Controller from where we come on this Controller
        navigationController?.popViewController(animated: true)
    }
    
}
