//
//  EmailSupportViewController.swift
//  studentModule
//
//  Created by mac on 11/03/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import MessageUI

class EmailSupportViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func emailButton(_ sender: Any) {
        showMailComposer()
    }
    
    func  showMailComposer()  {
        guard MFMailComposeViewController.canSendMail() else{
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["aamir.khan268@yahoo.com"])
        composer.setSubject("Help!")
        composer.setMessageBody("Write your message here!  ", isHTML: false)
        
        present(composer, animated: true)
    }
}

extension EmailSupportViewController: MFMailComposeViewControllerDelegate{
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let _ = error{
            //Error
            controller.dismiss(animated: true)
            return
        }
        
        switch result {
        case .cancelled:
            print("Cancelled")
        case .failed:
            print("Failed to send")
        case .sent:
            print("Email sent!")
            
        case .saved:
            print("Saved")
        }
        controller.dismiss(animated: true)
    }
    
}
