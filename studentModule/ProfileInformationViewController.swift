//
//  ProfileInformationViewController.swift
//  studentModule
//
//  Created by mac on 06/02/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import Firebase
import CoreData

class ProfileInformationViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtId: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtCourse: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtBloodGroup: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtphone: UITextField!
    
   
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //retrieveMessages()
    }

  
    @IBAction func homeButton(_ sender: Any) {
        //This is used to back to that Controller from where we come on this Controller
        navigationController?.popViewController(animated: true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    //Text View Moves up
    func textFieldDidBeginEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 250), animated: true)
    }
    
    //Text View Back to Normal Position
    func textFieldDidEndEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
   /* func fecthData(){
    //following method get the registers user details
        let ref : DatabaseReference!
        ref = Database.database().reference()
    ref.child("users").child(user!.user.uid).observeSingleEvent(of: .value, with: { snapshot in
    // let postDict = snapshot.value as! [String : String]
    print("before!!!!!!!!")
    if   let data = snapshot.value as? [String:Any ]
    
    {
    if let role = data["Role"] as? String{
    print(data)
    
    if role == "1" {
    self.twoCase()
    
    }else if role == "2"{
    self.firstCase()
    }
    
    print(role)
    
    }
    
    }
    else{
    print("Else one")
    self.threeCase()
    }
    
    })
    }
    */
    
   /* //TODO: Create the retrieveMessages method here:
    
    func retrieveMessages(){
        
        let messageDB = Database.database().reference().child("Student Profile")
        
        messageDB.observe(.childAdded, with: { (snapshot) in
            
            if snapshot.key == "id" {
                self.txtId.text = snapshot.value as? String
            }
                
            else if snapshot.key == "name" {
                self.txtName.text = snapshot.value as? String
                
            }else if snapshot.key == "course" {
                self.txtCourse.text = snapshot.value as? String
                
            }else if snapshot.key == "address"{
                self.txtAddress.text = snapshot.value as? String
                
            }else if snapshot.key == "blood group"{
                self.txtBloodGroup.text = snapshot.value as? String
                
            }else if snapshot.key == "phone"{
                self.txtphone.text = snapshot.value as? String
                
            }else if snapshot.key == "email"{
                self.txtEmail.text = snapshot.value as? String
            }
            
        })
        
    } */
    
    
}
