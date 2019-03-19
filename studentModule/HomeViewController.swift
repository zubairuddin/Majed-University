//
//  SecondViewController.swift
//  studentModule
//
//  Created by mac on 31/01/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //For Showing Navigation Bar on the Top of the Controller
        navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        //when we click on Courses Button Page will be moved to Courses Page
        let vc = storyboard?.instantiateViewController(withIdentifier: "CoursesViewController") as! CoursesViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
   
}
