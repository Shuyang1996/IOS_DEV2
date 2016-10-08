//
//  ViewController.swift
//  compare2
//
//  Created by 于舒洋 on 10/7/16.
//  Copyright © 2016 Compare. All rights reserved.
//

import UIKit

class ViewController: UITabBarController, UITabBarControllerDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = "Chats"
        
        
        // main tab bar items
        // Create chats tab
        let tabChats = chatsController()
        let tabChatsBarItem = UITabBarItem(title: "Chats", image: UIImage(named: "chats.png"), selectedImage: UIImage(named: "selectedImage.png"))
        
        tabChats.tabBarItem = tabChatsBarItem
        
        
        // Create moments tab
        let tabMoments = momentsController()
        let tabMomentsItem = UITabBarItem(title: "Moments", image: UIImage(named: "moments.png"), selectedImage: UIImage(named: "selectedImage2.png"))
        tabMoments.tabBarItem = tabMomentsItem
        
        
        // Create profile tab
        let tabProfile = profilePicController()
        let tabProfileBarItem2 = UITabBarItem(title: "Profile", image: UIImage(named: "profile.png"), selectedImage: UIImage(named: "selectedImage2.png"))
        
        tabProfile.tabBarItem = tabProfileBarItem2
        
        
        // Create user tab
        let tabUser = userController()
        let tabUserItem = UITabBarItem(title: "User",  image: UIImage(named: "me.png"), selectedImage: UIImage(named: "selectedImage2"))
        tabUser.tabBarItem = tabUserItem
        
        
        self.viewControllers = [tabChats, tabMoments, tabProfile, tabUser]
    }
    
    // UITabBarControllerDelegate method
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }


}

