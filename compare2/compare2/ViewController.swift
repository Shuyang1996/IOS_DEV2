//
//  ViewController.swift
//  compare2
//
//  Created by 于舒洋 on 10/7/16.
//  Copyright © 2016 Compare. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationItem.leftBarButtonItem = UIBarButtonItem(title:"logout", style:.plain, target: self, action: #selector(handleLogout))
        
        if FIRAuth.auth()?.currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        }
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

