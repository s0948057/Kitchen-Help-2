//
//  ViewController.swift
//  Kitchen Help
//
//  Created by Miranda Richardson on 2/5/18.
//  Copyright © 2018 Miranda Richardson. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: UITableViewController,  GIDSignInUIDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
    }
    //when the signin complets
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        //if any error stop and print the error
        if error != nil{
            print(error ?? "google error")
            return
        }
        
      
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        if touch.view is GIDSignInButton {
            return false
        }
        return true
    }
    func dismissKeyboard() {
        self.view.endEditing(true)
    }


}

