//
//  RequestsViewController.swift
//  studentModule
//
//  Created by mac on 04/02/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class RequestsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

  
    @IBAction func homeButton(_ sender: UIButton) {
        
        //This is used to back to that Controller from where we come on this Controller
        navigationController?.popViewController(animated: true)
    }
    
}
