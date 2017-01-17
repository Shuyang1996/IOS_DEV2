//
//  ViewController.swift
//  compare2
//
//  Created by 于舒洋 on 10/7/16.
//  Copyright © 2016 Compare. All rights reserved.
//

import UIKit
import Firebase

class MessageController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationItem.leftBarButtonItem = UIBarButtonItem(title:"logout", style:.plain, target: self, action: #selector(handleLogout))
        
        // create a new message button
        let image = UIImage(named: "newMessage")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleNewMessage))
        
        
        checkIfUserIsLoggedIn()
    }
    
    func handleNewMessage(){
        let newMessageController = NewMessageController()
        let navController = UINavigationController(rootViewController: newMessageController)
        present(navController, animated: true, completion: nil)
    }
    
    
    func checkIfUserIsLoggedIn(){
        // if the user has not logged in
        if FIRAuth.auth()?.currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        } else {
            let uid = FIRAuth.auth()?.currentUser?.uid
            
            FIRDatabase.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
                  // funtion associated with this function 
                
                  if let dictionary = snapshot.value as? [String: AnyObject] {
                      self.navigationItem.title = dictionary["names"] as? String
                  }
                
                }, withCancel: nil)
            
        } // close for else statement
    }
    
    
    func handleLogout(){
        
        do {
            try FIRAuth.auth()?.signOut() // Firebase syntax, firebase signout function
        } catch let logoutError {
            print(logoutError)
        }
        
        let loginController = LoginController()
        present(loginController, animated:true, completion:nil)
        
    }
    

}

