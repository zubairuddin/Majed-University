//
//  AdvisorMessagesViewController.swift
//  studentModule
//
//  Created by mac on 28/02/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import Firebase

class AdvisorMessagesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var arrMessage = [AdvisorMessage]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        retrieveMessages()
    }

    
    //TODO: Create the retrieveMessages method here:
    
    func retrieveMessages(){
        
        let messageDB = Database.database().reference().child("Query").child("Advisor Messages")
        
        messageDB.observe(.childAdded, with: { (snapshot) in
            
            let snapshotValue = snapshot.value as! Dictionary<String,String>
            let text = snapshotValue["MessageBody"]!
            print(text)
            
            let sender = snapshotValue["Sender"]!
            print(sender)
            let message = AdvisorMessage()
            
            message.messageBody = text
            message.sender = sender
            
            self.arrMessage.append(message)
            self.tableView.reloadData()
           
        })
        
    }
    
    @IBAction func homeButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension AdvisorMessagesViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMessage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdvisorMessageTableViewCell", for: indexPath) as! AdvisorMessageTableViewCell
        
        //cell.lblSender.text = arrMessage[indexPath.row].sender
        cell.lblSender.text = arrMessage[indexPath.row].sender
        cell.lblMessage.text = arrMessage[indexPath.row].messageBody
        return cell
    }
    
    
}
