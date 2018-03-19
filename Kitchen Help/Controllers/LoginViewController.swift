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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

