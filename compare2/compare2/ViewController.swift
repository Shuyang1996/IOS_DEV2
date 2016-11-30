//
//  ViewController.swift
//  compare2
//
//  Created by 于舒洋 on 10/7/16.
//  Copyright © 2016 Compare. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title:"logout", style:.plain, target: self, action: #selector(handleLogout))
    }
    
    func handleLogout(){
        let loginController = LoginController()
        present(loginController, animated:true, completion:nil)
        
    }
    

}

