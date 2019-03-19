//
//  AdminCreateUserViewController.swift
//  studentModule
//
//  Created by mac on 06/03/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class AdminCreateUserViewController: UIViewController {

    @IBOutlet weak var txtStudentUserName: UITextField!
    
    @IBOutlet weak var txtProfessorSpecialisation: UITextField!
    @IBOutlet weak var txtProfessorNationalId: UITextField!
    @IBOutlet weak var txtProfessorPhone: UITextField!
    @IBOutlet weak var txtProfessorAddress: UITextField!
    @IBOutlet weak var txtProfessorId: UITextField!
    @IBOutlet weak var txtProfessorName: UITextField!
    @IBOutlet weak var txtStudentNationalId: UITextField!
    @IBOutlet weak var txtStudentPhone: UITextField!
    @IBOutlet weak var txtStudentAddress: UITextField!
    @IBOutlet weak var txtStudentId: UITextField!
    @IBOutlet weak var txtStudentName: UITextField!
    @IBOutlet weak var txtProfessorPassword: UITextField!
    @IBOutlet weak var txtProfessorUserName: UITextField!
    @IBOutlet weak var txtStudentPassword: UITextField!
    
    var userArray  = [StudentUserCreate]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addStudentButton(_ sender: Any) {
        
        let idReg: String = "[1]{1}[0-9]{6}"
        let idTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@ ", idReg)
        
        if idTest.evaluate(with: self.txtStudentId.text!) == false {
            let alert: UIAlertView = UIAlertView(title: "Enter Valid Id", message: "Please Enter Valid User Id.", delegate: nil, cancelButtonTitle: "Ok")
            alert.show()
        }
        else {
            let ref = Database.database().reference()
            Auth.auth().createUser(withEmail: txtStudentUserName.text!, password: txtStudentPassword.text!, completion: { (user, error) in
                if((error) != nil)
                {
                    print("Error is !!!!!!!")
                    self.alertTwo()
                }
                else
                {
                    let userDictionary : [String : String] = ["Email": self.txtStudentUserName.text! , "Password": self.txtStudentPassword.text! , "Role": "2" , "Name": self.txtStudentName.text! , "Id": self.txtStudentId.text! , "Phone": self.txtStudentPhone.text! , "Address": self.txtStudentAddress.text! , "National Id": self.txtStudentNationalId.text! ]
                    
                    let usersNode : [String : String] = ["Role": "2"]
                    
                    
                    
                    // following method is a add user's  more details
                    ref.child("Student User").child(user!.user.uid).setValue(userDictionary)
                    ref.child("users").child(user!.user.uid).setValue(usersNode)
                    self.resetStudentFields()
                    
                    self.alert()
                    
                    //following method get the registers user details
                    ref.child("Student User").child(user!.user.uid).observeSingleEvent(of: .value, with: { snapshot in
                        let postDict = snapshot.value as! [String : AnyObject]
                        print("User is = \(postDict)")
                    })
                    
                }
            })
        }
    }
    func resetStudentFields() {
        self.txtStudentName.text = ""
        self.txtStudentUserName.text = ""
        self.txtStudentPassword.text = ""
        self.txtStudentId.text = ""
        self.txtStudentPhone.text = ""
        self.txtStudentAddress.text = ""
        self.txtStudentNationalId.text = ""
    }
    func resetProfessorFields() {
        self.txtProfessorUserName.text = ""
        self.txtProfessorPassword.text = ""
        self.txtProfessorName.text = ""
        self.txtProfessorId.text = ""
        self.txtProfessorPhone.text = ""
        self.txtProfessorAddress.text = ""
        self.txtProfessorNationalId.text = ""
        self.txtProfessorSpecialisation.text = ""
    }
    
    @IBAction func addProfessorButton(_ sender: Any) {
        
        let idReg: String = "[2]{1}[0-9]{6}"
        let idTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@ ", idReg)
        
        if idTest.evaluate(with: self.txtProfessorId.text!) == false {
            let alert: UIAlertView = UIAlertView(title: "Enter Valid Id", message: "Please Enter Valid User Id.", delegate: nil, cancelButtonTitle: "Ok")
            alert.show()
        } else {
            
            let ref = Database.database().reference()
            Auth.auth().createUser(withEmail: txtProfessorUserName.text!, password: txtProfessorPassword.text!, completion: { (user, error) in
                if((error) != nil)
                {
                    self.alertTwo()
                    print("Error is !!!!!!!")
                }
                else
                {
                    let userDictionary : [String : String] = ["Email": self.txtProfessorUserName.text! , "Password": self.txtProfessorPassword.text! , "Role": "1" , "Name": self.txtProfessorName.text! , "Id": self.txtProfessorId.text! , "Phone": self.txtProfessorPhone.text! , "Address": self.txtProfessorAddress.text! , "National Id": self.txtProfessorNationalId.text! , "Specialisation": self.txtProfessorSpecialisation.text!]
                    
                    let usersNode : [String : String] = ["Role": "1"]
                    
                    // following method is a add user's  more details
                    ref.child("Professor User").child(user!.user.uid).setValue(userDictionary)
                    ref.child("users").child(user!.user.uid).setValue(usersNode)
                    self.resetProfessorFields()
                    
                    self.alert()
                    
                    //following method get the registers user details
                    ref.child("Professor User").child(user!.user.uid).observeSingleEvent(of: .value, with: { snapshot in
                        let postDict = snapshot.value as! [String : AnyObject]
                        print("User is = \(postDict)")
                    })
                    
                }
                
            })
        }
    }
    
    
    // Method for alert when credential is wrong
    func alert(){
        var alert = UIAlertController(title:"Success!!", message:"Successfully Added User", preferredStyle:.alert)
        alert.addAction(UIAlertAction(title:"OK",style: UIAlertActionStyle.default, handler:nil))
        
        self.present(alert, animated:true, completion:nil)
    }
    
    // Method for alert when credential is wrong
    func alertTwo(){
        var alert = UIAlertController(title:"Alert", message:"Please Enter Required Fields!", preferredStyle:.alert)
        alert.addAction(UIAlertAction(title:"OK",style: UIAlertActionStyle.default, handler:nil))
        
        self.present(alert, animated:true, completion:nil)
    }
    @IBAction func homeButton(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
    
    
}
