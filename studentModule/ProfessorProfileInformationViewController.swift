//
//  ProfessorProfileInformationViewController.swift
//  studentModule
//
//  Created by mac on 11/02/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import Firebase

class ProfessorProfileInformationViewController: UIViewController, UITextFieldDelegate,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var txtId: UITextField!
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtSpecialisation: UITextField!
    
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtBloodGroup: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        txtId.delegate = self
        txtName.delegate = self
        txtPhone.delegate = self
        scrollView.delegate = self
        retrieveMessages()
    }

    
    @IBAction func homeButton(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
    
    //TODO: Create the retrieveMessages method here:
    
    func retrieveMessages(){
        
        let messageDB = Database.database().reference().child("Professor Profile")
        
        messageDB.observe(.childAdded, with: { (snapshot) in
            
            if snapshot.key == "id" {
                self.txtId.text = snapshot.value as? String
            }
            
            else if snapshot.key == "name" {
                self.txtName.text = snapshot.value as? String
                
            }else if snapshot.key == "specialisation" {
                self.txtSpecialisation.text = snapshot.value as? String
                
            }else if snapshot.key == "address"{
                self.txtAddress.text = snapshot.value as? String
                
            }else if snapshot.key == "blood group"{
                self.txtBloodGroup.text = snapshot.value as? String
                
            }else if snapshot.key == "phone"{
                self.txtPhone.text = snapshot.value as? String
                
            }else if snapshot.key == "email"{
                self.txtEmail.text = snapshot.value as? String
            }
            
        })
        
    }
    
}
