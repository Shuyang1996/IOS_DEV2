//
//  LoginControllerHandlers.swift
//  compare2
//
//  Created by 于舒洋 on 1/18/17.
//  Copyright © 2017 Compare. All rights reserved.
//

import UIKit
import Firebase

// why we use delegate here
extension LoginController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func handleRegister() {
        //create variables carrying data
        guard let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text else {
            print("Form is not valid")
            return
        }
        
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: {
            (user:FIRUser?, error) in
            if error != nil {
                print(error)
                return
            }
            
            guard let uid = user?.uid else {
                return
            }
            
            //successfully authenticated user
            
            // setup to store images 
            
            
            
            let ref = FIRDatabase.database().reference(fromURL: "https://comparedev-7a014.firebaseio.com/")
            let usersReference = ref.child("users").child(uid)
            let values = ["names":name, "email":email]
            
            usersReference.updateChildValues(values,withCompletionBlock: { (err, ref) in
                if err != nil {
                    print(err)
                    return
                }
                
                //this is a bug after user register
                self.dismiss(animated: true, completion: nil)
            })
            
        })
    }// close tag for handleRegister func
    
    // func to show image picker
    func handleSelectProfileImageView(){
        let picker = UIImagePickerController()
         picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func
    
    
    
}
