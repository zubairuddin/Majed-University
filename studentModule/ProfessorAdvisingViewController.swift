//
//  ProfessorAdvisingViewController.swift
//  studentModule
//
//  Created by mac on 05/03/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import Firebase

class ProfessorAdvisingViewController: UIViewController, UITextViewDelegate {


    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var messageTxtField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //when we click on Return Button on Keyboard this method is called
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    //Text View Moves up
    func textViewDidBeginEditing(_ textView: UITextView) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 80), animated: true)
    }
    
    //Text View Back to Normal Position
    func textViewDidEndEditing(_ textView: UITextView) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    @IBAction func sendButton(_ sender: Any) {
        
       let messageDB = Database.database().reference().child("Professor").child("Advisor Messages")
        
        let messageDictionary = [ "MessageBody" : messageTxtField.text]
        
        messageDB.childByAutoId().setValue(messageDictionary){
            (error, reference) in
            
            if error != nil {
                print(error!)
            }else{
                print("Message Saved Suuccessfully!")
                self.messageTxtField.text = ""
                
                
            }
        }
    }
    @IBAction func homebutton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
}
