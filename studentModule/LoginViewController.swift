//
//  ViewController.swift
//  studentModule
//
//  Created by mac on 31/01/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD
import CoreData



class LoginViewController: UIViewController, UITextFieldDelegate {

    var studentArr = [StudentUserCreate]()
    var currentSelection = 0
    
    //Outlet for ID text field
    @IBOutlet weak var loginTextField: UITextField!
    
    //Outlet for Password text field
    @IBOutlet weak var passwordTextField: UITextField!
    
    //This method is called once when our Screen loads up
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //For hidding Navigation Bar for this Controller i.e. Login Page
        navigationController?.isNavigationBarHidden = true
    }
 
    //This Method is called when we move back to this page from next page
    override func viewWillAppear(_ animated: Bool) {
          navigationController?.isNavigationBarHidden = true
    }

    
    //Action Button for Login
    @IBAction func loginButton(_ sender: UIButton) {
        SVProgressHUD.show()
        
        // Password and Email Authentication from Firebase
        Auth.auth().signIn(withEmail: loginTextField.text!, password: passwordTextField.text!) { (user, error) in
            
            //Error condition when we Enter wrong credentials
            if error != nil{
                
                // This will appear in Console
                print(error!)
                
                // Calling alert Method for Alert
                self.alert()
                
                //Progress Bar terminated
                SVProgressHUD.dismiss()
                
                //Login and Password field will be reset blank 
                self.loginTextField.text = ""
                self.passwordTextField.text = ""
            }
                
            else  //Success Condition
            {
                //following method get the registers user details
                let ref = Database.database().reference()
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
                            }else {
                                print("Else one")
                                self.threeCase()
                            }
                            
                            
                            print(role)
                            
                        }
                    }else{
                        self.threeCase()
                    }
                })
                
              /*  //following method get the registers user details
                ref.child("Student User").child(user!.user.uid).observeSingleEvent(of: .value, with: { snapshot in
                    // let postDict = snapshot.value as! [String : String]
                    print("before!!!!!!!!")
                    if   let data = snapshot.value as? [String:Any ]
                        
                    {
                        if let role = data["Role"] as? String{
                            print(data)
                            
                            if role == "2" {
                                self.firstCase()
                                
                            }else {
                                print("Else one")
                                self.threeCase()
                            }
                            /*else if role == "2"{
                             self.firstCase()
                             }*/
                            
                            print(role)
                            
                        }
                        
                    }
                })*/
                
                //self.threeCase()
                
                // This will appear in Console
                print("Login Successful!")
                
                //Progress Bar terminated
                SVProgressHUD.dismiss()
                
                // self.threeCase()
                //Move to Home Page when we have entered valid Id and Password
                //    let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                //     self.navigationController?.pushViewController(vc, animated: true)
                //  }
                // }
                
            }
        }
        
    }
   
    // Method for alert when credential is wrong
    func alert(){
       var alert = UIAlertController(title:"Login Failed", message:"Incorrect Id or Password", preferredStyle:.alert)
        alert.addAction(UIAlertAction(title:"OK",style: UIAlertActionStyle.default, handler:nil))
        
        self.present(alert, animated:true, completion:nil)
    }
    
    
    //When we click on screen Keyboard will be diappeared
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    //When we click on Return button on Keyboard, Keyboard will be disappeared
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    
    
  /*  @IBAction func loginButton(_ sender: UIButton) {
        SVProgressHUD.show()
        if currentSelection == 0 {
            SVProgressHUD.dismiss()
          firstCase()
        }else if  currentSelection == 1  {
            SVProgressHUD.dismiss()
            twoCase()
        }else if currentSelection == 2  {
            SVProgressHUD.dismiss()
            threeCase()
        }else{
            SVProgressHUD.dismiss()
            alert()
        }
    }
    @IBAction func selectButton(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
          self.currentSelection = 0
        case 1:
            self.currentSelection = 1
        case 2:
           self.currentSelection = 2
        default:
            print("No selection")
        }
    } */
    
    func firstCase(){
        let lv = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        navigationController?.pushViewController(lv, animated: true)
        
    }
    
    func twoCase(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProfessorLoginViewController") as! ProfessorLoginViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func threeCase(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "AffairsHomeViewController") as! AffairsHomeViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
 
    

}



