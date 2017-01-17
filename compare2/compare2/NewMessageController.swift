//
//  NewMessageController.swift
//  compare2
//
//  Created by 于舒洋 on 1/16/17.
//  Copyright © 2017 Compare. All rights reserved.
//

import UIKit
import Firebase

class NewMessageController: UITableViewController {

    let cellId = "cellId"
    
    // this syntax is interesting, need to dig into it
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(handleCancel) )
        // create a class for the identifier cell
        tableView.register(UserCell.self, forCellReuseIdentifier: cellId)
        
        fetchUser()
    }
    
    func fetchUser(){
        FIRDatabase.database().reference().child("users").observe(.childAdded, with: { (snapshot) in
            print(snapshot)
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let user = User()
                
                // if you use this setter, your app will crash if your class properties don't exactly match up with the firebase dictionary keys
                
                user.setValuesForKeys(dictionary)
                //safer way
                //user.name = dictionary["name"]
                
                self.users.append(user)
                // just reload the table will crash the app, so lets user dispatch_async to fix
//                DispatchQueue.main.asynchronously(execute: {
//                    self.tableView.reloadData()
//                })
//                
//                dispatch_async(dispatch_get_main_queue(), {
//                    self.tableView.reloadData()
//                })
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
        }, withCancel: nil)
    }
    
    func handleCancel(){
        dismiss(animated: true, completion: nil )
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // this is a hack for now
        // let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.names
        cell.detailTextLabel?.text = user.email
    
        return cell

    }
 }

class UserCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

