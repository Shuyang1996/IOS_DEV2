 //
//  LoginController.swift
//  compare2
//
//  Created by 于舒洋 on 11/30/16.
//  Copyright © 2016 Compare. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 61, g: 91, b: 151)
        
        let inputsContainerView = UIView();
        inputsContainerView.backgroundColor = UIColor.white
        
        view.addSubview(inputsContainerView)
        
        //need x,y, width, height constraints
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
    }

//    override func preferredStatusBarStyle() -> UIStatusBarStyle {
//        return .lightContent
//    }
//   
    
    
}
 
// this modified
extension UIColor {
    
    convenience  init(r: CGFloat, g:CGFloat, b:CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha:1 )
    }
 
}

