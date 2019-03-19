//
//  ProfessorCoursesPickerViewController.swift
//  studentModule
//
//  Created by mac on 10/02/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class ProfessorCoursesPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    var rowSelected:Int! = -1
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var button: UIView!
    
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
        pickerData = ["SECTION","CA","LA"]
    }
    
    
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    @IBAction func firstButton(_ sender: UIButton) {
        
       
        
        if  rowSelected == 1{
            let vc = storyboard?.instantiateViewController(withIdentifier: "ProfessorCoursesViewController") as! ProfessorCoursesViewController
            navigationController?.pushViewController(vc, animated: true)
        
        }else if  rowSelected == 2{
            let la = storyboard?.instantiateViewController(withIdentifier: "ProfessorCoursesLaViewController") as! ProfessorCoursesLaViewController
            navigationController?.pushViewController(la, animated: true)
        
    }
        
    
    }
    @IBAction func secondButton(_ sender: UIButton) {
        if  rowSelected == 1{
            let vc = storyboard?.instantiateViewController(withIdentifier: "ProfessorCoursesSecondCaViewController") as! ProfessorCoursesSecondCaViewController
            navigationController?.pushViewController(vc, animated: true)
            
        }else if  rowSelected == 2{
            let la = storyboard?.instantiateViewController(withIdentifier: "ProfessorCoursesSecondLaViewController") as! ProfessorCoursesSecondLaViewController
            navigationController?.pushViewController(la, animated: true)
            
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         rowSelected = row
}
    
    @IBAction func homeButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
