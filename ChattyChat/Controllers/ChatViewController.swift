//
//  ChatViewController.swift
//  ChattyChat
//
//  Created by Андрей Останин on 15.08.2020.
//  Copyright © 2020 Андрей Останин. All rights reserved.
//

import UIKit
import Firebase
import IQKeyboardManagerSwift

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)

        title = Constants.appName
        navigationItem.hidesBackButton = true
        
        loadMessages()
    }
    
    func loadMessages() {
        
        db.collection(Constants.FStore.collectionName)
            .order(by: Constants.FStore.dateField)
            .addSnapshotListener { (quierySnapshot, error) in
                
            self.messages = []
            
            if let e = error {
                print("There is an issut with getting messages: \(e)")
            } else {
                if let docs = quierySnapshot?.documents {
                    for doc in docs {
                        let data = doc.data()
                        if let messageSender = data[Constants.FStore.senderField] as? String,
                            let messageBody = data[Constants.FStore.bodyField] as? String {
                            let newMessage = Message(name: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                
                                let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                            }
                            
                        }
                    }
                }
            }
        }
        
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
        
        if let messageBody = messageTextfield.text, let sender = Auth.auth().currentUser?.email, messageBody != " " {
            db.collection(Constants.FStore.collectionName).addDocument(data: [
                Constants.FStore.senderField: sender,
                Constants.FStore.bodyField: messageBody,
                Constants.FStore.dateField: Date().timeIntervalSince1970
                ]) { (error) in
                    if let e = error {
                        print("Invalid adding: \(e)")
                    } else {
                        print("Data has been saved successfully")
                        self.messageTextfield.text = ""
                    }
                }
        }

    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let authError as NSError {
            print("Error signing out: \(authError)")
        }
    }
    
}

extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text = message.body
        
        if message.name == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.userImageView.isHidden = false
            cell.bodyView.backgroundColor = UIColor(named: Constants.BrandColors.messageColor)
            cell.label.textColor = .white
        } else {
            cell.leftImageView.isHidden = false
            cell.userImageView.isHidden = true
            cell.bodyView.backgroundColor = UIColor(named: Constants.BrandColors.messageColor)
            cell.label.textColor = .white
        }
        
        return cell
    }
}

